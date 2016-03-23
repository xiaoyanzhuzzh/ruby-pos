class Printer

  def print_invoice cart_item_list
    print_header
    print_details cart_item_list
    puts '---------------------'
    print_total_price cart_item_list
    print_footer
  end

  def print_details cart_item_list
    cart_items_details = ''
    cart_item_list.each do  |cart_item|
      cart_items_details << "名称: #{cart_item.item.name}, 数量: #{cart_item.number}#{cart_item.item.unit}, 单价: #{format_price(cart_item.item.price)}(元), 小计: #{format_price(cart_item.sub_total)}(元)\n"
    end
    puts cart_items_details.to_s
    cart_items_details
  end

  def print_header
    puts '***<没钱赚商店>购物清单***'
  end

  def print_footer
    puts '**********************'
  end

  def print_total_price cart_item_list
    total_price = 0.0
    cart_item_list.each do |cart_item|
      total_price += cart_item.sub_total
    end
    puts '总计: ' + format_price(total_price).to_s + '(元)'
    total_price
  end

  def format_price price
    format("%.2f", price)
  end
end