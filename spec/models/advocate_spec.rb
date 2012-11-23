#encoding: utf-8

require 'spec_helper'

describe Advocate do
  
  let(:advocate) do
    FactoryGirl.create(:advocate)
  end
  
  
  
  describe "Валидация" do
    
    def create_advocate_should_raise_record_invalid(args = {})
      lambda{ FactoryGirl.create(:advocate, args) }.should raise_error(ActiveRecord::RecordInvalid)
    end
    
    describe "Статус" do
      it "Не может быть пустым" do
        create_advocate_should_raise_record_invalid(:status => nil)
      end
      
      it "Не должен быть отличен от заданного списка значений" do
        create_advocate_should_raise_record_invalid(:status => :invalid_status)
      end
    end
    
    describe "Реестровый номер" do
      it "Не может быть пустым" do
        create_advocate_should_raise_record_invalid(:reg_num => nil)
      end
      it "Уникальный реестровый номер" do
        create_advocate_should_raise_record_invalid(:reg_num => advocate.reg_num)
      end
      it "Должен быть в заданном формате" do
        create_advocate_should_raise_record_invalid(:reg_num => "invalid/format")
      end
    end
    
    describe "Пол" do
      it "Не должен быть отличен от заданного списка значений" do
        create_advocate_should_raise_record_invalid(:sex => :invalid_sex)
      end
    end
        
  end
  
end
