class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def index; end

  def create
    @event = Event.create(event_params)

    respond_to do |format|
      if @event.save
        flash[:success] = 'One step closer!'
        format.html { redirect_to @event }
      else
        flash[:error] = 'Something went wrong D:'
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def show
    @event = Event.friendly.find(params[:id])
    @voter = Voter.new
  end

  def notify
    @event = Event.friendly.find(params[:id])
    @voter = Voter.find(cookies[:voter_id])
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :minimum, :start_date, :end_date)
  end
end
