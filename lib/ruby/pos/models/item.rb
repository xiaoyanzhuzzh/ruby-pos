class Item
  attr_accessor :barcode, :name, :price, :unit, :promotion
  def initialize(barcode, name, price, unit, promotion)
    @barcode = barcode
    @name = name
    @price = price
    @unit = unit
    @promotion = promotion
  end
end