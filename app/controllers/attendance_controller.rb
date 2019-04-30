class AttendanceController < ApplicationController

    def create
        if current_user
            @attendance = Attendance.new(attendance_params)

            if @attendance.save
                redirect_to root_url
            else
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
