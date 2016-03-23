require 'rspec'
require 'ruby/pos/printer'
require 'ruby/pos/models/item'
require 'ruby/pos/models/cart_item'

describe Printer do

  subject(:printer) { Printer.new }

  describe '#printDetails' do

    let(:item) { Item.new('ITEM000001', 'apple', 3.0, '个') }
    let(:item1) { Item.new('ITEM000002', 'watermelon', 1.0, '斤') }
    let(:cart_item_list) { [CartItem.new(item, 3)] }
    let(:cart_item_list1) { [CartItem.new(item, 3), CartItem.new(item1, 13)] }

    it 'should print one cart item details when give one cart item' do
      details = printer.print_details(cart_item_list)
      expect(details).to eq("名称: apple, 数量: 3个, 单价: 3.00(元), 小计: 9.00(元)\n")
    end

    it 'should print two cart items details when give two cart items' do
      details = printer.print_details(cart_item_list1)
      expect(details).to eq("名称: apple, 数量: 3个, 单价: 3.00(元), 小计: 9.00(元)\n" +
        "名称: watermelon, 数量: 13斤, 单价: 1.00(元), 小计: 13.00(元)\n")
    end
  end

  describe "#getTotalPrice" do
    let(:item) { Item.new('ITEM000001', 'apple', 3.0, '个') }
    let(:item1) { Item.new('ITEM000002', 'watermelon', 1.0, '斤') }
    let(:cart_item_list1) { [CartItem.new(item, 3), CartItem.new(item1, 13)] }

    it 'should calculate the total price' do
      total_price = printer.print_total_price cart_item_list1
      expect(total_price).to eq(22.00)
    end
  end


end