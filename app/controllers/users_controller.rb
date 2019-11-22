class UsersController < ApplicationController

   

    def new
        @user = User.new
    end

    def show
    end

    def create
       @user = User.new(user_params)
       if @user.save
        session[:user_id] = @user.id
        redirect_to root_url
       else
        flash[:danger] = "Error"
        render "new"
       end
    end

    private
    def user_params
        params.require(:user).permit(:name,:password,:age)
    end
end
