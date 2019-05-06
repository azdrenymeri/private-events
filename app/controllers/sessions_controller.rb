class SessionsController < ApplicationController

    def new
    end

    def create
        @user = User.find_by_name(params[:user_name])
        
        if @user 
            session[:user_id] = @user.id
            redirect_to events_path
        else
            flash[:danger] = "Wrong username"
            redirect_to login_path
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to root_url
    end
end
