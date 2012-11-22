#encoding: utf-8

Допустим /^в регионе "(.*?)" существует адвокатская палата "(.*?)"$/ do |region, acol|
  region = Region.find_by_name(region)
  region.create_acol(:name => acol)
end
