require 'rspec'
require 'ruby/pos/scanner'
require 'ruby/pos/models/item'
require 'ruby/pos/models/cart_item'

describe Scanner do

  let(:apple) { Item.new('ITEM000001', 'apple', 3.0, '个') }
  let(:watermelon) { Item.new('ITEM000003', 'watermelon', 1.0, '斤') }
  let(:cola) { Item.new('ITEM000005', 'cola', 2.5, '瓶')}

  let(:cart_apple) { [CartItem.new(apple, 5)] }
  let(:cart_watermelon) { CartItem.new(watermelon, 2)}
  let(:cart_cola) { CartItem.new(cola, 3)}

  let(:all_item_list) { [apple, watermelon, cola]}

  describe '#parseInputs' do

    it 'should generate ccaparse data to correct json format' do
      cart_item_list = Scanner.generate_cart_item_list all_item_list
      expect(cart_item_list.length).to eq(3)

      expect(cart_item_list[0].item_barcode).to eq(apple.barcode)
      expect(cart_item_list[0].number).to eq(5)

      expect(cart_item_list[1].item_barcode).to eq(watermelon.barcode)
      expect(cart_item_list[1].number).to eq(2)

      expect(cart_item_list[2].item_barcode).to eq(cola.barcode)
      expect(cart_item_list[2].number).to eq(3)
    end
  end

end