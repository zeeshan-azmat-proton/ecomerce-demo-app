class User < ActiveRecord::Base
  resourcify
  rolify

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  attr_accessible :email, :password, :password_confirmation, :remember_me
  after_create :assign_default_role

  has_many :cart_itmes
  has_many :items, :through => :cart_itmes

 
  protected
    def assign_default_role
      add_role(:user)
    end

end
