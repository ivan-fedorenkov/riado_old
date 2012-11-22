# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :advocate, :class => 'Advocates' do
    second_name "MyString"
    first_name "MyString"
    patronomic "MyString"
    reg_num "MyString"
    status "MyString"
    sex "MyString"
  end
end
