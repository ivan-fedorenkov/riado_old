#encoding: utf-8

require 'spec_helper'

describe RegionsController do

  describe 'Смена текущего региона' do
    
    context 'Запрашиваемый регион существует' do

      let(:region) { 
        FactoryGirl.create(:region, :name => 'Москва') 
      }

      it 'Должен произвести поиск региона по заданному имени и 
          сохранить текущий регион в сессию, куки и переменную текущего региона' do

        Region.should_receive(:find_by_name).with(region.name).and_return(region)
        get :set_current, :region => region.name.to_uri
        response.cookies['current_region_id'].should eq(region.id.to_s)
        session['current_region'].should == region
        assigns[:current_region].should == region
      end

    end

    context 'Запрашиваемый регион не существует' do

      let(:default_region) { 
        FactoryGirl.create(
            :region, 
            :name => 'Регион по-умолчанию',
            :default => true) 
      }

      it 'Должен быть установлен регион по-умолчанию' do
        Region.should_receive(:default)
        get :set_current, :region => default_region.name.to_uri
        assigns[:current_region].should == default_region
      end
    end

  end

end
