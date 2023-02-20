class TweetsController < ApplicationController

    def new
        @tweet = Tweet.new

    end

    def create
        tweet = Tweet.new(tweet_params)
        tweet.student_id = current_student.id
        if tweet.save!
            redirect_to student_path(current_student.id)
            
        else
            redirect_to  new_tweet_path
        end
        
    end

    def show
        @tweet = current_teacher.tweets
        @tweet = @tweet.page(params[:page]).per(2)
    end
    def show2
        # @date = params[:date]
        # @tweets =Student.find(current_student.id).tweets.where("created_at LIKE ? ",'%' + params[:date] + '%')
        @tweets = current_student.tweets
    end


    def edit
        @tweet = Tweet.find(params[:id])
        @date = params[:date]
    end

    def update
        tweet = Tweet.find(params[:id])
        @date = params[:date]
        if tweet.update(tweet_params)
            redirect_to student_path(current_student.id)
        else
            redirect_to new_tweet_path
        end
    end

    def destroy
        tweet = Tweet.find(params[:id])
        tweet.destroy
        redirect_to student_path(current_student.id)
    end
    private
    def tweet_params
        params.require(:tweet).permit(:body,:objective,:practice,:learned)
    end
end



