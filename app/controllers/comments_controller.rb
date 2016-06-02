class CommentsController < ApplicationController
	
    
	def create 
		@comment = Comment.new(comment_params)
		@issue = Issue.find(params[:issue_id])
		if @comment.save
			redirect_to @issue 
		end 
	end



	private

	def comment_params
		params.require(:comment).permit(:author, :content, :issue_id)
	end 

end
