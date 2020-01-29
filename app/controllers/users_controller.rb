class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to Private Events!"
      redirect_to @user
    else
      render 'new'
      end
  end

  def show
    @user = User.find(params[:id])
    if logged_in?
      @event = @user.events.build
      @feed_items = @user.feed.paginate(page: params[:page])
      @prev_events = @user.events.previous_events
      @upcoming_events = @user.events.upcoming_events

      @prev_events_attend, @upcoming_events_attend =[], []
       
        @user.event_attendance.each do |x|
        y= Event.find_by(id: x.attended_event)
          if y.date >= DateTime.now
          @upcoming_events_attend.push(y)
          elsif y.date < DateTime.now
          @prev_events_attend.push(y)   
          end  
        end
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
