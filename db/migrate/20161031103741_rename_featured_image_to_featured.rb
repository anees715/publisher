class RenameFeaturedImageToFeatured < ActiveRecord::Migration
  def change
  	rename_column :articles, :featured_image, :featured
  end
end
