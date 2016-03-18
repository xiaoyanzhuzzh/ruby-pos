require 'rspec'
require 'ruby/pos/printer'
require 'ruby/pos/models/cart_item'

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

    let(:item_list) { ['ITEM000001','ITEM000002'] }

    it 'should print the item list details' do
      details = printer.print_details(item_list)
      expect(details).to eq(['ITEM000001','ITEM000002'])
    end
  end

end