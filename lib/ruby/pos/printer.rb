class Printer

  def print_details cart_item_list
    cart_items_details = ''
    cart_item_list.each do  |cart_item|
      cart_items_details << "名称: #{cart_item.item.name}, 数量: #{cart_item.number}#{cart_item.item.unit}, 单价: #{cart_item.item.price}(元), 小计: #{cart_item.sub_total}(元)\n"
    end
    cart_items_details
  end

  def print_header
    '***<没钱赚商店>购物清单***'
  end

  def print_footer
    '**********************'
  end

  def get_total_price cart_item_list
    total_price = 0.0
    cart_item_list.each do |cart_item|
      total_price += cart_item.sub_total
    end
    total_price
  end
end