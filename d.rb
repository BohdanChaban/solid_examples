# Dependency inversion principle

# bad example

class OrderSender
  def initialize(data, customer)
    @data = data
    @customer = customer
  end

  def send_via_sms
    SmsSender.new.send(@data, @customer)
  end

  def send_via_email
    EmailSender.new.send(@data, @customer)
  end
end

class SmsSender
  def send(data, customer)
    # sms
  end
end

class EmailSender
  def send(data, customer)
    # email
  end
end

#good example

class OrderSender
  def initialize(data, customer)
    @data = data
    @customer = customer
  end

  def send_order(sender = EmailSender.new)
    sender.send(@data, @customer)
  end
end

class SmsSender
  def send(data, customer)
    # sms
  end
end

class EmailSender
  def send(data, customer)
    # email
  end
end
