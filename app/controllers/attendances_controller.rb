class AttendancesController < ApplicationController

    def create
        if current_user
            @attendance = Attendance.new(attendance_params)

            if @attendance.save
                flash[:success] = "Now You are atteding this event"
                redirect_to event_path(@attendance.attended_event_id)
            else
                flash[:danger] = "Something went wrong. Please try again later"
                redirect_to event_path(@attendance.attended_event_id)
            end

        else
            redirect_to root_url
        end
    end


    private 

    def attendance_params
        params.require(:attendance).permit(:attendee_id,:attended_event_id)
    end
end
