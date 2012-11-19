#encoding: utf-8

require 'spec_helper'

describe ApplicationController do
  
  controller do
    def index
      render :text => "index called"
    end
  end
  
  describe 'Фильтры' do
    let(:region) { FactoryGirl.create(:region, :name => "region") }
    
    describe 'Фильтр установки списка регионов' do
      before do
        @regions = []
        10.times { |i| @regions << FactoryGirld.create(:region, :name => "Регион#{i}") }
        get :index
        assigns[:regions].should == @regions
      end
    end

    describe 'Фильтр установки текущего региона' do
      it 'Должен взять текущий регион из сессиии' do
        session[:current_region] = region
        get :index
        assigns[:current_region].should == region
      end
      it 'Должен взять регион из куки если сессия не содержит текущего региона' do
        request.cookies['current_region_id'] = region.id
        get :index
        assigns[:current_region].should == region
      end
      it 'Должен взять регион по-умолчанию если ни сессия, ни куки не содержат региона' do
        default_region = FactoryGirl.create(:region, :name => "default region", :default => true)
        get :index
        assigns[:current_region].should == default_region
      end
    end

  end

end
