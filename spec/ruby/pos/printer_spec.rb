require 'rspec'
require 'ruby/pos/printer'
require 'ruby/pos/models/item'
require 'ruby/pos/models/cart_item'

describe Printer do

  subject(:printer) { Printer.new }
  let(:apple) { Item.new('ITEM000001', 'apple', 3.0, '个', '') }
  let(:watermelon) { Item.new('ITEM000002', 'watermelon', 1.0, '斤', '') }
  let(:pear) { Item.new('ITEM000003', 'pear', 8.0, '个', 'buy_two_get_one')}
  let(:cart_item_list) { [CartItem.new(apple, 3)] }
  let(:cart_item_list1) { [CartItem.new(apple, 3), CartItem.new(watermelon, 13)] }

  let(:cart_item_list_with_buy_two_get_one) { [CartItem.new(pear, 10), CartItem.new(apple, 3)]}

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

    it 'should print promotion info when given one buy_two_get_one item' do

      subject.register_cart_item_list cart_item_list_with_buy_two_get_one
      details = printer.invoice_details
      expect(details).to eq("名称: pear, 数量: 10个, 单价: 8.00(元), 小计: 56.00(元)\n" +
                                "名称: apple, 数量: 3个, 单价: 3.00(元), 小计: 9.00(元)\n" +
                                "----------------------------------\n" +
                                "买二赠一商品:\n" +
                                "名称: pear, 数量: 3个\n")
    end
  end

  describe '#invoiceTotal' do

    it 'should calculate the total price when without any promotion items' do
      subject.register_cart_item_list cart_item_list1

      total_price = printer.invoice_total
      expect(total_price).to eq('总价: 22.00(元)')
    end

    it 'should calculate both the total price and discounted price when with promotion items' do
      subject.register_cart_item_list cart_item_list_with_buy_two_get_one
      total_price = printer.invoice_total
      expect(total_price).to eq("总价: 65.00(元)\n节省: 24.00(元)")
    end
  end

end