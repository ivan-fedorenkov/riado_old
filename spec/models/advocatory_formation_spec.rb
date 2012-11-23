#encoding: utf-8

require 'spec_helper'


describe AdvocatoryFormation do
  
  let(:advocatory_formation) { FactoryGirl.create(:advocatory_formation) }
  
  describe "Валидация" do
    
    describe "Название" do
      it "Не может быть пустым" do
        create_should_raise_record_invalid(:advocatory_formation, :name => nil)
      end
    end
    
    describe "Форма" do
      it "Не может быть пустой" do
        create_should_raise_record_invalid(:advocatory_formation, :form => nil)
      end
      it "Должна быть в рамках заданных значений" do
        create_should_raise_record_invalid(:advocatory_formation, :form => :invalid_form)
      end  
    end
    
    describe "Добавление адвокатов" do
      it "Адвокатский кабинет может содержать только одного адвоката" do
        advocatory_formation.stub(:form).and_return(:cabinet)
        (lambda do
          2.times { advocatory_formation.advocates << FactoryGirl.build(:advocate) }
          advocatory_formation.save!
        end).should raise_error(ActiveRecord::RecordInvalid)
      end
      
      {:college => "Коллегия адвокатов",
       :bureau => "Адвокатское бюро",
       :consultation => "Адвокатская консультация"}.each do |form, form_name|
        it "#{form_name} может содержать несколько адвокатов" do
          advocatory_formation.stub(:form).and_return(form)
          (lambda do
            2.times { advocatory_formation.advocates << FactoryGirl.build(:advocate) }
            advocatory_formation.save!
          end).should_not raise_error(ActiveRecord::RecordInvalid)
        end
      end
    end
    
    describe "Добавление филиалов" do
      {:cabinet => "Адвокатский кабинет",
       :bureau => "Адвокатское бюро",
       :consultation => "Адвокатская консультация"}.each do |form, form_name|
        
        it "#{form_name} не может иметь филиалов" do
          advocatory_formation.stub(:form).and_return(form)
          (lambda do
            advocatory_formation.filials << FactoryGirl.build(:advocatory_formation)
            advocatory_formation.save!
          end).should raise_error(ActiveRecord::RecordInvalid)
        end
        
        it "#{form_name} не может иметь главного филиала" do
          advocatory_formation.stub(:form).and_return(form)
          (lambda do
            advocatory_formation.head_department = FactoryGirl.create(:advocatory_formation)
            advocatory_formation.save!
          end).should raise_error(ActiveRecord::RecordInvalid)
        end
        
      end
      
      it "Коллегия адвокатов может иметь филиалы" do
        advocatory_formation.stub(:form).and_return(:college)
        (lambda do
          advocatory_formation.head_department = FactoryGirl.create(:advocatory_formation)
          advocatory_formation.save!
        end).should_not raise_error(ActiveRecord::RecordInvalid)
      end
      
      it "Коллегия адвокатов может иметь главный филиал" do
        advocatory_formation.stub(:form).and_return(:college)
        (lambda do
          advocatory_formation.filials << FactoryGirl.build(:advocatory_formation)
          advocatory_formation.save!
        end).should_not raise_error(ActiveRecord::RecordInvalid)
      end
        
    end
    
  end # Валидация
  
end
