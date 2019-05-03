class SessionController < ApplicationController

    def new
    end

    def create
        @user = User.find_by_name(params[:user_name])
        session[:user_id] = @user.id
        redirect_to events_path
    end
    def destroy
        session[:user_id] = nil
        redirect_to root_url
    end
end
