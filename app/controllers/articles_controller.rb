class ArticlesController < ApplicationController

	before_action :authenticate_user!, except: [:index, :show]

	def index
		@articles = Article.all
		@popular_posts = Article.order("comments_count DESC")
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(article_params)
		@article.user_id = current_user.id
		@article.published_on = DateTime.now
		if @article.save
			redirect_to articles_path, notice: "Successfully Created"
		else
			render action: "new"
		end
	end

	def show
		@article = Article.find(params[:id])
	end

	def edit
		@article = Article.find(params[:id])
		@comments = @article.comments
	end

	def update
		@article = Article.new
		if @article.update_attributes(article_params)
			redirect_to article_path(@article), notice: "Succesfully Updated"
		else
			render action: "edit"
		end
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy
		redirect_to articles_path
	end

private

	def article_params
		params[:article].permit(:title, :body, :featured_image, category_ids: [])
	end

end
