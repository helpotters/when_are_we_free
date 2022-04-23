class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = Event.create
  end
end
