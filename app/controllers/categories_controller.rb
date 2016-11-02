class CategoriesController < ApplicationController
	
	def index
		@categories = Category.all
	end

	def new
		@category = Category.new
	end

	def create
		@category = Category.new(category_params)
		if @category.save
			redirect_to categories_path, notice: "Successfully Added"
		else
			render action: "new"
		end
	end

	def show
		@articles = Category.find(params[:id]).articles
	end

	def edit
		@category = Category.find(params[:id])
	end

	def update
		@category = Category.find(params[:id])
		if @category.update_attributes(category_params)
			redirect_to category_path(@category), notice: "Successfully updated"
		else
			render action: "edit"
		end
	end

	def destroy
		@category = Category.find(params[:id])
		@category.destroy
		redirect_to categories_path, notice: "Successfully destroyed"
	end

	
private

	def category_params
		params[:category].permit(:name)
	end
end
