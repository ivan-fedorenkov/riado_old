#encoding: utf-8

Допустим /^существует регион "(.*?)"( \(по-умолчанию\))?$/ do |region, default|
  region = FactoryGirl.build(:region, :name => region)
  region.default = true if default
  region.save!
end

Допустим /^я выбрал регион "(.*?)"$/ do |region|
  visit(set_current_region_path(:region => region.to_uri))
end
