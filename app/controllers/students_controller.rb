class StudentsController < ApplicationController
    
    def show
        @student = Student.find(params[:id])
        # @days = Tweet.group("date(created_at)")
        @days=@student.tweets.pluck(:created_at).map{|d|d.strftime("%Y-%m-%d")}.uniq

    end
    
    
end
