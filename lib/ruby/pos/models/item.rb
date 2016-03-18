class Item
  attr_accessor :barcode, :name, :price, :unit, :number
  def initialize(barcode, name, price, unit, number)
    @barcode = barcode
    @name = name
    @price = price
    @unit = unit
    @number = number
  end

  def sub_total
    @price * @number
  end
end