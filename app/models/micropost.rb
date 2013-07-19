class Micropost < ActiveRecord::Base
  attr_accessible :resources, :user_id
end
