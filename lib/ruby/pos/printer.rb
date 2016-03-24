class Printer

  def print_invoice cart_item_list
    puts "#{invoice_header}\n#{invoice_details(cart_item_list)}"
    puts '-------------------------------------'
    puts "#{invoice_total(cart_item_list)}\n#{invoice_footer}"
  end

  def invoice_header
    '***<没钱赚商店>购物清单***'
  end

  def invoice_details cart_item_list
    cart_items_details = ''
    cart_item_list.each do |cart_item|
      cart_items_details << "名称: #{cart_item.item_name}, 数量: #{cart_item.number}#{cart_item.item_unit}, 单价: #{format_price(cart_item.item_price)}(元), 小计: #{format_price(cart_item.sub_total)}(元)\n"
    end
    cart_items_details
  end

  def invoice_total cart_item_list
    total_price = cart_item_list.map{|cart_item| cart_item.sub_total}.reduce(0){
      |sum, each_total| sum += each_total
    }
    "总价: #{format_price(total_price)}(元)"
  end

  def invoice_footer
    '**********************'
  end

  def format_price price
    format('%.2f', price)
  end
end