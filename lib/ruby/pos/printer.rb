class Printer

  def register_cart_item_list cart_item_list
    @cart_item_list = cart_item_list
  end

  def print_invoice
    puts "#{invoice_header}\n#{invoice_details}"
    puts '-------------------------------------'
    puts "#{invoice_total}\n#{invoice_footer}"
  end

  def invoice_header
    '***<没钱赚商店>购物清单***'
  end

  def invoice_details
    get_items_details << get_promotion_details
  end

  def invoice_total
    total_price = @cart_item_list.map{|cart_item| cart_item.subtotal}.reduce(0){
      |sum, each_total| sum += each_total
    }
    original_total_price = @cart_item_list.map{|cart_item| cart_item.number * cart_item.item_price}.reduce(0){
        |sum, each_total| sum += each_total
    }
    discounted_price = original_total_price - total_price != 0.00 ? "\n节省: #{format_price(original_total_price - total_price)}(元)" : ''

    "总价: #{format_price(total_price)}(元)#{discounted_price}"
  end

  def invoice_footer
    '**********************'
  end

  private
  def format_price price
    format('%.2f', price)
  end

  private
  def get_items_details
    item_details = ''
    @cart_item_list.each do |cart_item|
      if cart_item.item_promotion.eql?(0.95)
        item_details << "名称: #{cart_item.item_name}, 数量: #{cart_item.number}#{cart_item.item_unit}, 单价: #{format_price(cart_item.item_price)}(元), 小计: #{format_price(cart_item.subtotal)}(元), 节省: #{format_price(cart_item.item_price * cart_item.number - cart_item.subtotal)}(元)\n"
      else
        item_details << "名称: #{cart_item.item_name}, 数量: #{cart_item.number}#{cart_item.item_unit}, 单价: #{format_price(cart_item.item_price)}(元), 小计: #{format_price(cart_item.subtotal)}(元)\n"
      end
    end
    item_details
  end

  private
  def get_promotion_details
    promotion_details = ''
    buy_two_get_one_cart_item_list = @cart_item_list.select { |each| each.item_promotion.eql?('buy_two_get_one') }
    promotion_details << "----------------------------------\n买二赠一商品:\n" unless buy_two_get_one_cart_item_list.empty?
    buy_two_get_one_cart_item_list.each do |each_cart_item|
      promotion_details << "名称: #{each_cart_item.item_name}, 数量: #{each_cart_item.number / 3}#{each_cart_item.item_unit}\n"
    end
    promotion_details
  end

end