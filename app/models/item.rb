class Item < ActiveRecord::Base
  attr_accessible :name, :price , :category_id
  belongs_to :category
  validates :name , :price , :category_id , presence: true
  validates :name , uniqueness: true

  has_many :cart_items
  has_many :users, :through => :cart_items

  before_destroy :ensure_not_referenced_by_any_line_item
  

  private
    # ensure that there are no line items referencing this product
    def ensure_not_referenced_by_any_line_item
      if line_items.empty?
        return true
      else
        errors.add(:base, 'Line Items present')
        return false
      end
    end

end
