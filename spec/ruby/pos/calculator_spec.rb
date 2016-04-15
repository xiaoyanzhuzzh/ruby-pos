require 'rspec'
require 'ruby/pos/calculator'
require 'ruby/pos/models/item'
require 'ruby/pos/models/cart_item'

describe Calculator do

  let(:apple) { Item.new('ITEM000001', 'apple', 3.0, '个', 'buy_two_get_one') }
  let(:cart_apple) { CartItem.new(apple, 3) }

  describe '#calculate_buy_two_get_one' do

    it 'should calculate correct subtotal when given a buy_two_get_one cart item' do
      subtotal = Calculator.calculate_buy_two_get_one cart_apple
      expect(subtotal).to eq(6.00)
    end
  end
end