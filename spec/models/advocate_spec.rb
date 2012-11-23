#encoding: utf-8

require 'spec_helper'

describe Advocate do
  
  let(:advocate) do
    FactoryGirl.create(:advocate)
  end
  
  
  
  describe "Валидация" do

    describe "Статус" do
      it "Не может быть пустым" do
        create_should_raise_record_invalid(:advocate, :status => nil)
      end
      
      it "Не должен быть отличен от заданного списка значений" do
        create_should_raise_record_invalid(:advocate, :status => :invalid_status)
      end
    end
    
    describe "Реестровый номер" do
      it "Не может быть пустым" do
        create_should_raise_record_invalid(:advocate, :reg_num => nil)
      end
      it "Уникальный реестровый номер" do
        create_should_raise_record_invalid(:advocate, :reg_num => advocate.reg_num)
      end
      it "Должен быть в заданном формате" do
        create_should_raise_record_invalid(:advocate, :reg_num => "invalid/format")
      end
    end
    
    describe "Пол" do
      it "Не должен быть отличен от заданного списка значений" do
        create_should_raise_record_invalid(:advocate, :sex => :invalid_sex)
      end
    end
        
  end
  
end
