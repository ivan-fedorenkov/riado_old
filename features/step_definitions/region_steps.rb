#encoding: utf-8

Допустим /^существует регион "(.*?)" с региональным кодом (\d+)$/ do |регион, код|
  FactoryGirl.create(:region, :code => код, :name => регион)
end

Допустим /^я выбрал регион "(.*?)"$/ do |регион|
  visit(set_current_region_path(Region.find_by_name(регион)))
end
