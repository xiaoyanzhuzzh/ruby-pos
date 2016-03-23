class CartItem
  attr_accessor :number
  def initialize(item, number)
    @item = item
    @number = number
  end

  def sub_total
    @item.price * @number
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

end