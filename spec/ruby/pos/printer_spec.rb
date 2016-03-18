require 'rspec'
require 'ruby/pos/printer'
require 'ruby/pos/models/item'

describe Printer do

  subject(:printer) { Printer.new }
  describe '#printHeader' do

    it 'should print header of the invoice' do
      header = '***<没钱赚商店>购物清单***'
      expect(printer.print_header).to eq(header)
    end
  end

  describe '#printFooter' do

    it 'should print footer of the invoice' do
      footer = '**********************'
      expect(printer.print_footer).to eq(footer)
    end
  end

  describe '#printDetails' do

    let(:item) { Item.new('ITEM000001', 'apple', 3.0, '个', 3) }
    let(:item1) { Item.new('ITEM000002', 'watermelon', 1.0, '斤', 13) }
    let(:item_list) { [item] }
    let(:item_list1) { [item, item1] }

    it 'should print one item details when give one item' do
      details = printer.print_details(item_list)
      expect(details).to eq("名称: apple, 数量: 3个, 单价: 3.0(元), 小计: 9.0(元)\n")
    end

    it 'should print two items details when give two items' do
      details = printer.print_details(item_list1)
      expect(details).to eq("名称: apple, 数量: 3个, 单价: 3.0(元), 小计: 9.0(元)\n" +
        "名称: watermelon, 数量: 13斤, 单价: 1.0(元), 小计: 13.0(元)\n")
    end
  end

end