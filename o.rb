# Open/closed principle

# bad example
class ShopLogger
  def initialize
    @format = "%s: %s\n" # change format in this class is bad decision
  end

  def log(msg)
    STDOUT.write @format % [Time.now, msg]
  end
end

ShopLogger.new.log('Product added to cart')

# good example 1 - inheritance

class CartLogger < ShopLogger
  def initialize
    @format = "%s Cart: %s\n"
  end
end

CartLogger.new.log('Product added')

# good example 2 - composition

class MyLogger
  def log(msg, formatter: MyLogFormatter.new)
    STDOUT.write formatter.format(msg)
  end
end
