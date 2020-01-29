class EventsController < ApplicationController
  before_action :logged_in?, only: [:create]

  def new
    @event = Event.new
  end

  def create
    current_user = User.find_by(id: session[:user_id])
    @event = current_user.events.build(event_params)
    if @event.save
      flash[:success] = "Event created!"
      redirect_to current_user
    else
      @feed_items = []
      flash[:danger] = "No events"
      redirect_to current_user
    end
  end

  def show
    @event = Event.find_by(id: params[:id])
    @creator = @event.user
    @atendee_z = []
    @event.event_attendance.each do |x|
      t = User.find_by(id: x.attendee).name
      @atendee_z << t
    end
  end

  def index
    @events = Event.all
    @upcoming_events = Event.upcoming_events
    @prev_events = Event.previous_events
  end

  private

  def event_params
    params.require(:event).permit(:eventname, :description, :date)
  end
end
