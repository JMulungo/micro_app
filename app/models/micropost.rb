class Micropost < ActiveRecord::Base
  attr_accessible :resources, :user_id
  belongs_to :user
  validates :resources, :length => { maximum: 140}
end
