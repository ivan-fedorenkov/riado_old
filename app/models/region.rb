class Region < ActiveRecord::Base
  def to_s
    self.name
  end

  def self.default
    self.where(:default => true).first
  end

end
