class Advocate < ActiveRecord::Base
  
  belongs_to :acol
  
  # Advocate statuses enum (Symbolize library)
  symbolize :status, :in => [:active, :suspended, :stopped, :removed]
  symbolize :sex, :in => [:male, :female, nil]
  
  validates :reg_num, :format => { :with => /\d+\/\d+/ }
  validates :reg_num, :presence => true
  validates :reg_num, :uniqueness => true
  
end
