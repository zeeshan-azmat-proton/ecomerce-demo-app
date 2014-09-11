class User < ActiveRecord::Base
  resourcify
  rolify

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  attr_accessible :email, :password, :password_confirmation, :remember_me

  has_many :cart_itmes
  has_many :items, :through => :cart_itmes

 
  # after_create :assign_default_role
  # protected
  #   def assign_default_role
  #     add_role(:user)
  #   end

end
