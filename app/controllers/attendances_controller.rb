class AttendancesController < ApplicationController
  # def create
  #   @attend = Attendance.new
  #   @ttend.user_id = current_user.id
  #   @attend.event_id = params[:event_id]
  #   redirect_to current_user, notice: 'Event added to attending list' if @attend.save
  # end

  # def destroy
  #   @attend = Attendance.find_by(event_id: params[:id])
  #   redirect_to current_user, notice: 'Event removed from attending list' if @attend.destroy
  # end

  def create
    event = Event.find(params[:event_id])
    attendance = Attendance.new(event_id: event.id, user_id: params[:user_id])

    if attendance.save
      attendance.invited!
      flash[:notice] = 'Invitation sent!'
      redirect_to users_path(event_id: event.id)
    else
      flash[:alert] = 'Ooops! Something went wrong...'  
      redirect_to event_path(event)
    end
  end

  def destroy
    event = Event.find(params[:event_id])
    attendance = Attendance.find(params[:id])
    if current_user == event.creator
      attendance.destroy
      flash[:notice] = 'The invitation is cancelled!'
    else
      attendance.status = 'invited'
      attendance.save
      flash[:notice] = "You have dropped attending the #{event.name}!"
    end

    redirect_to users_path(event_id: event.id, id: attendance.id)
  end

  def update
    @event = Event.find(params[:event_id])
    @attendance = Attendance.find_by(event_id: params[:event_id], user_id: current_user.id)
    if @attendance && @attendance.invited?
      @attendance.accepted!
      flash[:notice] = "Thank you for signing up for the '#{@event.name}'!"
    else
      flash[:alert] = 'Your name is not on the invitation list'
    end

    redirect_to event_path(@event)
  end

  private

  def attendance_params
    params.require(:attendance).permit(:name, :date, :user_id, :event_id, :status)
  end 
end
