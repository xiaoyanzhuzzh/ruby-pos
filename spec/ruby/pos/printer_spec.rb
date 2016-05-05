require 'rspec'
require 'ruby/pos/printer'
require 'ruby/pos/models/item'
require 'ruby/pos/models/cart_item'

describe Printer do

  subject(:printer) { Printer.new }
  let(:apple) { Item.new('ITEM000001', 'apple', 3.0, '个', '') }
  let(:watermelon) { Item.new('ITEM000002', 'watermelon', 1.0, '斤', '') }

  let(:pear) { Item.new('ITEM000003', 'pear', 8.0, '个', 'buy_two_get_one')}
  let(:cola) { Item.new('ITEM000004', 'cola', 2.5, '瓶', 0.95)}

  let(:cart_item_list) { [CartItem.new(apple, 3)] }
  let(:cart_item_list_without_any_promotion) { [CartItem.new(apple, 3), CartItem.new(watermelon, 13)] }

  let(:cart_item_list_with_buy_two_get_one) { [CartItem.new(pear, 10), CartItem.new(apple, 3)]}
  let(:cart_item_list_with_discount) {[CartItem.new(apple, 3), CartItem.new(cola, 10)]}

  describe '#InvoiceDetails' do

    it 'should print one cart item details when give one cart item' do
      subject.register_cart_item_list cart_item_list

      details = printer.invoice_details
      expect(details).to eq("名称: apple, 数量: 3个, 单价: 3.00(元), 小计: 9.00(元)\n")
    end

    it 'should print two cart items details when give two cart items' do
      subject.register_cart_item_list cart_item_list_without_any_promotion

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

    it 'should print promotion info when given one discount item' do

      subject.register_cart_item_list cart_item_list_with_discount
      details = printer.invoice_details
      expect(details).to eq("名称: apple, 数量: 3个, 单价: 3.00(元), 小计: 9.00(元)\n" +
                                "名称: cola, 数量: 10瓶, 单价: 2.50(元), 小计: 23.75(元), 节省: 1.25(元)\n")
    end
  end

  describe '#invoiceTotal' do

    it 'should calculate the total price when without any promotion items' do
      subject.register_cart_item_list cart_item_list_without_any_promotion

      total_price = printer.invoice_total
      expect(total_price).to eq('总价: 22.00(元)')
    end

    it 'should calculate both the total price and discounted price when with buy_two_get_one items' do
      subject.register_cart_item_list cart_item_list_with_buy_two_get_one
      total_price = printer.invoice_total
      expect(total_price).to eq("总价: 65.00(元)\n节省: 24.00(元)")
    end

    it 'should calculate both the total price and discounted price when with discount items' do
      subject.register_cart_item_list cart_item_list_with_discount
      total_price = printer.invoice_total
      expect(total_price).to eq("总价: 32.75(元)\n节省: 1.25(元)")
    end
  end

end