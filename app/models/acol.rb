class Acol < ActiveRecord::Base
  belongs_to :region
  has_many :advocates, :dependent => :nullify
end
