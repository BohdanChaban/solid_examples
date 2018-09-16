# Single responsibility principle

# bad example
class OrderPerformer
  def initialize(products, customer)
    @products = products
    @customer = customer
    @order = ''
  end

  def create_order
    @order = @products.each { |p| p "#{p[:name]} #{p[:price]} $"}.join('\n')
  end

  def send_order
    p "Order is sent to #{@customer[:email]}"
  end
end

creator = OrderPerformer.new(
  [{ name: 'laptop', price: 777 }],
  email: 'customer1@example.com'
)
creator.create_order
creator.send_order

# good example

class OrderCreator
  def initialize(products)
    @products = products
    @order = ''
  end

  def create_order
    @order = @products.each { |p| p "#{p[:name]} #{p[:price]} $"}.join('\n')
  end
end

class OrderSender
  def initialize(order, customer)
    @customer = customer
    @order = order
  end

  def send_order
    p "Order is sent to #{@customer[:email]}"
  end
end

order = OrderCreator.new([{ name: 'laptop', price: 555 }]).create_order
OrderSender.new(order, email: 'customer2@example.com').send_order
