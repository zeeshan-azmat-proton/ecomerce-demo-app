class Cart < ActiveRecord::Base
  attr_accessible :bill, :user_id, :status
  has_many :cart_items
  belongs_to :user
end
