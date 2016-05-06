class Calculator
  def self.calculate_subtotal cart_item
    case cart_item.item_promotion
      when 'buy_two_get_one'
        calculate_buy_two_get_one cart_item
      when 0.95
        calculate_discount cart_item
      else
        cart_item.item_price * cart_item.number
    end
  end

  private
  def self.calculate_buy_two_get_one cart_item
    promotion_number = cart_item.number / 3
    (cart_item.number - promotion_number) * cart_item.item_price
  end

  private
  def self.calculate_discount cart_item
    discount =  cart_item.item_promotion.to_f
    cart_item.item_price * cart_item.number * discount
  end
end