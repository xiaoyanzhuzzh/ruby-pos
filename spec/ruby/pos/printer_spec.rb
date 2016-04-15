require 'rspec'
require 'ruby/pos/printer'
require 'ruby/pos/models/item'
require 'ruby/pos/models/cart_item'

describe Printer do

  subject(:printer) { Printer.new }
  let(:item) { Item.new('ITEM000001', 'apple', 3.0, '个') }
  let(:item1) { Item.new('ITEM000002', 'watermelon', 1.0, '斤') }
  let(:cart_item_list) { [CartItem.new(item, 3)] }
  let(:cart_item_list1) { [CartItem.new(item, 3), CartItem.new(item1, 13)] }

  describe '#InvoiceDetails' do

    it 'should print one cart item details when give one cart item' do
      subject.register_cart_item_list cart_item_list

      details = printer.invoice_details
      expect(details).to eq("名称: apple, 数量: 3个, 单价: 3.00(元), 小计: 9.00(元)\n")
    end

    it 'should print two cart items details when give two cart items' do
      subject.register_cart_item_list cart_item_list1

      details = printer.invoice_details
      expect(details).to eq("名称: apple, 数量: 3个, 单价: 3.00(元), 小计: 9.00(元)\n" +
        "名称: watermelon, 数量: 13斤, 单价: 1.00(元), 小计: 13.00(元)\n")
    end
  end

  describe '#invoiceTotal' do

    it 'should calculate the total price' do
      subject.register_cart_item_list cart_item_list1

      total_price = printer.invoice_total
      expect(total_price).to eq('总价: 22.00(元)')
    end
  end

end