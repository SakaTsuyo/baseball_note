class TeachersController < ApplicationController

    def show
        @teacher = Teacher.find(params[:id])
        @students = current_teacher.students
        @days = current_teacher.tweets.pluck(:created_at).map{|d|d.strftime("%Y-%m-%d")}.uniq
    end
    
    def edit
        
    end
end
