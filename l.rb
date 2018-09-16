# Liskov substitution principle

# bad example

class Device
  def run
    p "#{self.class} is running"
  end
end

class Laptop < Device
  def charge
    p "#{self.class} is charging"
  end
end

Device.new.run
Laptop.new.run

Device.new.charge # undefined method `charge' for Device
Laptop.new.charge

# good example

class Device
  def run
    p "#{self.class} is running"
  end

  def charge
    ''
  end
end

class Laptop < Device
  def charge
    p "#{self.class} is charging"
  end
end

Device.new.run
Laptop.new.run

Device.new.charge
Laptop.new.charge
