class CommentsController < ApplicationController
    before_action :authenticate_teacher!

    def create
        tweet = Tweet.find(params[:tweet_id]) 
        comment = tweet.comments.build(comment_params)
        comment.teacher_id = current_teacher.id
        comment.save!
        redirect_to request.referer
    end
        private
        def comment_params
            params.require(:comment).permit(:content, :teacher_id, :student_id)
        end
    
end
