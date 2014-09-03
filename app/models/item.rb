class Item < ActiveRecord::Base
  attr_accessible :name, :price , :category_id
  belongs_to :category
  validates :name , :price , :category_id , presence: true
  validates :name , uniqueness: true

end
