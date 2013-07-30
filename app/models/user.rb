class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation
  acts_as_authentic
  has_many :microposts
  	validates_presence_of :password, :message => "pick a shorter password"
  	validates_length_of :name	, within: 6..20, too_long: 'pick a shorter name', too_short: 'pick a longer name'
  	validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/, on: :create
  	validates_confirmation_of :name, :password
    validates_confirmation_of :email,
                              message: 'should match confirmation'
	validates_presence_of :password_confirmation, if: :password_changed?
end
