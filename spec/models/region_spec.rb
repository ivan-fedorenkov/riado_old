#encoding: utf-8

require 'spec_helper'

describe Region do
  describe '#default' do
    it 'Должен вовзращать nil если региона по-умолчанию не существует' do
      Region.default.should == nil
    end

    it 'Должен возвращать первый регион по-умолчанию' do
      default_region = FactoryGirl.create(:region, :name => 'default', :default => true)
      Region.default.should == default_region
    end
  end
end
