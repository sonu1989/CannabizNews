ActiveAdmin.register Store do
  permit_params :name, :admin_user_id
  
  form partial: 'form'
  
  index do
    column :name
    column :admin_user_id
    column :updated_at
    actions
  end

  action_item only: :index do
    if current_admin_user.admin?
      link_to 'Import Store', admin_stores_import_stores_path, class: 'import_csv'
    end
  end

  filter :name

  member_action :add_to_store, :method => :post do
    store = Store.find(params[:id])
    product = Product.find_by(id: params[:product_id])
    ProductStore.create(product_id: params[:product_id], store_id: store.id, price: params[:price]) if product
    redirect_to edit_admin_store_path(store)
  end

  member_action :delete_from_store, :method => :get do
    store = Store.find(params[:id])
    product_store = ProductStore.find_by(product_id: params[:product_id])
    product_store.delete
    redirect_to edit_admin_store_path(store)
  end

  member_action :update_product_store, :method => :put do
    store = Store.find(params[:id])
    product_store = ProductStore.find_by(id: params[:product_store_id])
    product_store.update_attributes(price: params[:price])
    render :json=> {product_store: product_store.reload}
  end

  collection_action :import_stores do
    if request.method == "POST"
      if params[:store][:file_name].present?
        file_data = params[:store][:file_name]
        if file_data.respond_to?(:read)
          stores = file_data.read
          Store.save_store_from_csv(stores)
          flash[:notice] = "Stores imported successfully."
        elsif file_data.respond_to?(:path)
          stores = File.read(file_data.path)
          Store.save_store_from_csv(stores)
          flash[:notice] = "Stores imported successfully."
        end
      end
      redirect_to admin_stores_path
    end
  end
end
