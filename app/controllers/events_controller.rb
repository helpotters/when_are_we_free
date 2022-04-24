class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = Event.create(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to event_url(@event.id), notice: 'Event created!' }
      else
        p @event.errors
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :description, :start_date, :end_date)
  end
end
