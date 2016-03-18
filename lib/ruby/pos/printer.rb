class Printer

  def print_details item_list
    items_details = ''
    item_list.each do  |item|
      items_details << "名称: #{item.name}, 数量: #{item.number}#{item.unit}, 单价: #{item.price}(元), 小计: #{item.sub_total}(元)\n"
    end
    items_details
  end

  def print_header
    '***<没钱赚商店>购物清单***'
  end

  def print_footer
    '**********************'
  end
end