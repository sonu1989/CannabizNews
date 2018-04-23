class Store < ActiveRecord::Base
  
  validates_presence_of :name
  attr_accessor :file_name

  belongs_to :admin_user
  has_many :product_stores
  has_many :products, through: :product_stores

  def self.save_store_from_csv(stores)
    csv = CSV.parse(stores, :headers => true)
    csv.each do |row|
      store  = Store.where("lower(name) =?", row['name'].to_s.downcase).first
      if store.present?
        store.update_attributes(name: row['name'], admin_user_id: row['admin_user_id'])
      else
        Store.create(name: row['name'], admin_user_id: row['admin_user_id'])
      end
    end
  end
end
