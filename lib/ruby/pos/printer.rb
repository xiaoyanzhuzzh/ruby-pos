class Printer
  def print_invoice
    print_header
    print_footer
  end

  def print_details item_list
    items_details = []
    item_list.each() { |item|
      items_details << item
    }
    items_details
  end

  def print_header
    '***<没钱赚商店>购物清单***'
  end

  def print_footer
    '**********************'
  end
end