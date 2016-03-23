class Item
  attr_accessor :barcode, :name, :price, :unit
  def initialize(barcode, name, price, unit)
    @barcode = barcode
    @name = name
    @price = price
    @unit = unit
  end
end