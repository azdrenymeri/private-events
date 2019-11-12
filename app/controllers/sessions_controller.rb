class SessionsController < ApplicationController
    
    
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
            puts "passed user"
            password = params[:user][:password]
            puts password
            puts @user
            if @user.password == password
                puts "didn't pass user2"
                session[:user_id] = @user.id
                flash[:success] = "Wellcome"
                redirect_to events_path
            else
                puts "didn't pass user3"
                flash[:danger] = "Error"
                redirect_to login_path
            end
        else
            puts "didn't pass user"
            flash[:danger] = "Error"
            redirect_to login_path
        end
        
    end

    def destroy
        session[:user_id] = nil
        redirect_to root_url
    end

end
