class AdminUser < ActiveRecord::Base
  role_based_authorizable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable
  
  has_one :store
  
  def seller_user?
    self.role == 'seller'
  end

  def admin?
    self.role == 'admin'
  end         
end
