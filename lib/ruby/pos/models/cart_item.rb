class CartItem
  attr_accessor :number, :item
  def initialize(item, number)
    @number = number
    @item = item
  end

  def sub_total
    @item.price * @number
  end

end