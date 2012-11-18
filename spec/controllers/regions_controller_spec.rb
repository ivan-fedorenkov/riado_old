#encoding: utf-8

require 'spec_helper'

describe RegionsController do

  describe 'Смена текущего региона' do


    context 'Запрашиваемый регион существует' do

      let(:region) { 
        FactoryGirl.create(:region, :code => 1, :name => 'Москва') 
      }

      it 'Должен произвести поиск региона по заданному коду и 
          сохранить текущий регион в сессию, куки и переменную текущего региона' do

        Region.should_receive(:find_by_code).with(region.code.to_s).and_return(region)
        get :set_current, :code => region.code
        response.cookies['current_region_code'].should eq(region.code.to_s)
        session['current_region'].should == region
        assigns[:current_region].should == region
      end
    end

    context 'Запрашиваемый регион не существует' do

      let(:default_region) { 
        FactoryGirl.create(
            :region, 
            :code => 0, 
            :name => 'Регион по-умолчанию') 
      }

      it 'Должен быть установлен регион по-умолчанию' do
        Region.should_receive(:default).and_return(default_region)
        get :set_current, :code => 666
        assigns[:current_region].should == default_region
      end
    end

  end

end
