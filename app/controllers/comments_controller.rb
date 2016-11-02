class CommentsController < ApplicationController


	def new
		@comment = Comment.new
	end

	def edit
		@article = Article.find(params[:article_id])
		@comment = @article.comments.find(params[:id])
	end
	
	def create
		@comment = Comment.new(comment_params)
		@article = Article.find(params[:article_id])
		@comment.article_id = @article.id
		@comment.user_id = current_user.id
		if @comment.save
			redirect_to article_path(@article), notice: "Sucessfully saved"
		else
			render action: "new", notice: "error"
		end
	end

private

def comment_params
	params[:comment].permit(:body)
end

end
