module ProductsHelper
  def shipping_fee_choice
    ['₩ 0', '₩ 2500']
  end

  def category_names
    Category.all.map(&:name)
  end
end
