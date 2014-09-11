class Item < ActiveRecord::Base
  attr_accessible :name, :price , :category_id
  belongs_to :category
  validates :name , :price , :category_id , presence: true
  validates :name , uniqueness: true

  has_many :cart_items
  has_many :users, :through => :cart_items

end
