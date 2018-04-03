class Store < ActiveRecord::Base
  belongs_to :admin_user
  has_many :product_stores
  has_many :products, through: :product_stores 
end
