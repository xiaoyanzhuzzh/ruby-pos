class Calculator
  def self.calculate_buy_two_get_one cart_item
    promotion_number = cart_item.number / 3
    actual_number = cart_item.number - promotion_number
    return actual_number * cart_item.item_price
  end
end