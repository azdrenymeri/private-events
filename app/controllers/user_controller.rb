class UserController < ApplicationController

   

    def new
    end
    def show
        if current_user 
            @events = current_user.events
        end
    end
    def create
       @user = User.new(name:params[:user_name],age:params[:user_age])

       if @user.save
        session[:user_id] = @user.id
        redirect_to root_url
       else
        render "new"
       end
    end


end
