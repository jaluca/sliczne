class Comment < ActiveRecord::Base
  belongs_to :note
  
  validates :content, :presence => true
  validates :author, :presence => true
end
