module PurchasesHelper
  def one_or_many(items)
    return if items.empty?
    if items.size == 1
      items.first.title
    else
      "#{items.first.title} and #{items.size - 1}"
    end
  end
end
