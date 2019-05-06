class UsersController < ApplicationController

   

    def new
    end

    def show
    end

    def create
       @user = User.new(name:params[:user_name],age:params[:user_age])

       if @user.save
        flash[:success] = "User Created Successfuly"
        session[:user_id] = @user.id
        redirect_to root_url
       else
        flash[:danger] = "Something went wrong. Please try again"
        render "new"
       end
    end


end
