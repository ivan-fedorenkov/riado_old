class Region < ActiveRecord::Base
  def to_s
    self.name
  end

  def self.default
    self.find(0)
  end
end
