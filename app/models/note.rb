class Note < ActiveRecord::Base
  has_many :comments, :dependent => :destroy
  
  validates :title, :presence => true
  validates :content, :presence => true
  validates :author, :presence => true
  
end

