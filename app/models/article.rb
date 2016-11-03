class Article < ActiveRecord::Base
	acts_as_paranoid
	mount_uploader :featured_image, AvatarUploader
	has_many :article_categories
	has_many :categories, through: :article_categories
	has_many :comments
	belongs_to :user

	validates_presence_of :title, :body, :categories
end
