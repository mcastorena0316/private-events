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
      @event = current_user.events.build
      @feed_items = current_user.feed.paginate(page: params[:page])
      @prev_events = []
      @upcoming_events = []
      @user.event_attendance.each do |x|
        y = Event.find_by(id: x.attended_event)
        @upcoming_events << y if y.date >= DateTime.now
        @prev_events << y if y.date < DateTime.now
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
