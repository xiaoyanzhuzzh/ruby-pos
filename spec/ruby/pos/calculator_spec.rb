require 'rspec'
require 'ruby/pos/calculator'
require 'ruby/pos/models/item'
require 'ruby/pos/models/cart_item'

describe Calculator do

  let(:apple) { Item.new('ITEM000001', 'apple', 3.0, '个', 'buy_two_get_one') }
  let(:watermelon) { Item.new('ITEM000002', 'watermelon', 1.0, '斤', 0.95) }

  let(:cart_apple) { CartItem.new(apple, 3) }
  let(:cart_watermelon) { CartItem.new(watermelon, 10)}

  describe '#calculate_subtotal' do

    context 'for buy_two_get_one cart item' do
      it 'should calculate correct subtotal when given a buy_two_get_one cart item' do
        subtotal = Calculator.calculate_subtotal cart_apple
        expect(subtotal).to eq(6.00)
      end
    end

    context 'for discount cart item' do
      it 'should calculate correct subtotal when given a discount cart item' do
        subtotal = Calculator.calculate_subtotal cart_watermelon
        expect(subtotal).to eq(9.50)
      end
    end
  end
end