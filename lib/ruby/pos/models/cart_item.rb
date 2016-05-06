require 'ruby/pos/calculator'
class CartItem
  attr_accessor :number
  def initialize(item, number)
    @item = item
    @number = number
  end

  def subtotal
    Calculator.calculate_subtotal self
  end

  def saved_money
    item_price * @number - self.subtotal
  end

  def item_barcode
    @item.barcode
  end

  def item_name
    @item.name
  end

  def item_price
    @item.price
  end

  def item_unit
    @item.unit
  end

  def item_promotion
    @item.promotion
  end

end