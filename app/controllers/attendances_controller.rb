class AttendancesController < ApplicationController
    def create
        @attend = Attendance.new
        @ttend.user_id = current_user.id
        @attend.event_id = params[:event_id]
        redirect_to current_user, notice: 'Event added to attending list' if @attend.save
      end 
      
      def destroy
        @attend = Attendance.find_by(event_id: params[:id])
        redirect_to current_user, notice: 'Event removed from attending list' if @attend.destroy
      end    
end
