#encoding: utf-8

Допустим /^я нахожусь на главной странице$/ do
  visit(root_path)
end

То /^я должен видеть "(.*?)"$/ do |content|
  page.should have_content(content)
end
