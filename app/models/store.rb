class Store < ActiveRecord::Base
  
  validates_presence_of :name

  belongs_to :admin_user
  has_many :product_stores
  has_many :products, through: :product_stores 
end
