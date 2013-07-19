class Micropost < ActiveRecord::Base
  attr_accessible :resources, :user_id
  belongs_to :user
  validates :resources, :length => { maximum: 140}
  #validates_length_of :resources, :within => 3..20 , :message => " - minimo de 3 e maximo de 20 caracteres"
end
