module PurchasesHelper
  def one_or_many(items)
    return if items.empty?
    if items.size == 1
      items.first.title
    else
      "#{items.first.title} and #{items.size - 1}"
    end
  end

  def render_shipping_status(shipping_status, arrive_date)
  case shipping_status
  when 0
    'Preparing product'
  when 1
    'Shipment in progress'
  when 2
    "Shipment completed on #{arrive_date}"
  end
  end
end
