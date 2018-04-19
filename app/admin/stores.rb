ActiveAdmin.register Store do
  permit_params :name, :admin_user_id
  
  form partial: 'form'
  
  index do
    column :name
    column :admin_user_id
    column :updated_at
    actions
  end

  filter :name

  member_action :add_to_store, :method => :post do
    store = Store.find(params[:id])
    product = Product.find(params[:product_id])
    store.products << product
    redirect_to edit_admin_store_path(store)
  end

  member_action :delete_from_store, :method => :get do
    store = Store.find(params[:id])
    product_store = ProductStore.find_by(product_id: params[:product_id])
    product_store.delete
    redirect_to edit_admin_store_path(store)
  end

end
