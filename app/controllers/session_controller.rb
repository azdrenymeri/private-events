class SessionController < ApplicationController

    def new
    end

    def create
        @user = User.find_by_name(params[:user_name])
        session[:user_id] = @user.id
    end
    def destroy
        session[:user_id] = @user.id
    end
end
