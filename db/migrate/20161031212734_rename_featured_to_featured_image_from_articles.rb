class RenameFeaturedToFeaturedImageFromArticles < ActiveRecord::Migration
  def change
  	rename_column :articles, :featured, :featured_image
  end
end
