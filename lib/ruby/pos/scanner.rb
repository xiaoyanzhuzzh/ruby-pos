class Scanner

  def self.generate_cart_item_list all_item_list
    cart_item_list = Array.new
    barcode_and_numbers = load_inputs.reduce(Hash.new(0)) { |a, b| a[b] += 1; a }
    barcode_and_numbers.map do |key, value|
        item = all_item_list.detect { |item| item.barcode == key}
        cart_item_list << CartItem.new(item, value)
    end
    cart_item_list
  end

  private
  def self.load_inputs
    barcode_list = Array.new
    File.foreach('inputs.txt') do |line|
      barcode, number = line.strip.chomp(',').split('-')
      number = number.nil? ? 1 : number.gsub(/\s|"|'/, '').to_i
      number.times do
        barcode_list << barcode.gsub(/\s|"|'/, '')
      end
    end
    barcode_list
  end
end