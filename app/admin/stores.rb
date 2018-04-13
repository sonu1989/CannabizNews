ActiveAdmin.register Store do
  permit_params :name, :admin_user_id
  
  actions :all, :except => [:new, :destroy], :if => proc{ current_admin_user.seller_user? }
  
  index do
    column :name
    column :admin_user_id
    column :updated_at
    actions
  end

  filter :name
  
  form do |f|
    f.inputs "Store" do
      f.input :name
      f.input :admin_user_id, :input_html => { :value => current_admin_user.id }, as: :hidden
    end
    f.actions
  end

end
