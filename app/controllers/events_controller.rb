class EventsController < ApplicationController


    def index
        if current_user 
        @events = Event.all
        else
            render login_path
        end
    end

    def new
        if current_user
            @event = Event.new
        else
            redirect_to login_path 
        end
    end
    
    def show
        @event = Event.find(params[:id])
        @attendance = Attendance.new
    end

    def create
        if current_user
            
        @event =  current_user.events.build(event_params)
            if @event.save
                redirect_to user_path(current_user)
            else
                render "new"
            end
        else
            redirect_to login_path
        end

    end

    private
    def event_params
    params.require(:event).permit(:title,:info,:date)
    end
end
