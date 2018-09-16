# Interface segregation principle

# bad example

class Product
  def buy; end

  def stock_replenish; end
end

class Customer
  def buy_product
    @product.buy
  end
end

class Manager
  def replenish_product
    @product.stock_replenish
  end
end

# good example

class Product
  def buy; end
end

class ProductStock
  def replenish; end
end

class Customer
  def buy_product
    @product.buy
  end
end

class Manager
  def replenish_product
    @product_stock.replenish
  end
end
