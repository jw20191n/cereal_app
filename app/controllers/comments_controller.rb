class CommentsController < ApplicationController
    
    def create
        @comment = Comment.create(comment_params)
        @cereal = Cereal.find(params[:comment][:cereal_id])
        redirect_to cereal_path(@cereal)
    end 

    private
    def comment_params
        params.require(:comment).permit(:content, :user_id, :cereal_id)
    end
end
