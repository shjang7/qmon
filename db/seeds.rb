Category.delete_all

['health', 'spring', 'fashion', 'travel', 'beauty', 'food'].each do |c|
  Category.create!(name: c)
end
