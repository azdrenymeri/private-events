class SessionsController < ApplicationController
    require 'byebug'
    
    def new
        if current_user == nil
        @user = User.new
        else
            redirect_to events_path
        end
    end

    def create
        
        @user = User.find_by_name(params[:user][:name])
        
        
        if @user 
            session[:user_id] = @user.id
            flash[:danger] = params
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
