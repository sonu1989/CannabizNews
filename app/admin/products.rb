ActiveAdmin.register Product do
  permit_params :name, :image, :ancillary, :product_type, :slug, :description, :featured_product, :short_description, :category_id, :year, :month, :alternate_names, :sub_category, :is_dom, :cbd, :cbn, :min_thc, :med_thc, :max_thc, :dsp_count
  
  actions :index, :show, :new, :create, :update, :edit

  index do
    column :name
    column :updated_at
    actions
  end
end
