require 'ruby/pos/calculator'
class CartItem
  attr_accessor :number
  def initialize(item, number)
    @item = item
    @number = number
  end

  def subtotal
    if @item.promotion == 'buy_two_get_one'
      Calculator.calculate_buy_two_get_one self
    elsif @item.promotion == 0.95
      Calculator.calculate_discount self
    else
      @item.price * @number
    end
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