class VotersController < ApplicationController
  def new; end

  def create
    @event = Event.friendly.find(params[:voter][:event_id])
    @voter = @event.voters.build(voter_params)

    respond_to do |format|
      if @voter.save
        cookies[:voter_id] = @voter.id
        format.html { redirect_to event_path(@event), notice: 'successfuly shared availability' }
        format.json { render json: @voter, status: :ok }
      else
        format.html { redirect_to event_path(@event) }
        format.json { render json: @voter.errors, status: unprocessable_entity }
      end
    end
  end

  def edit
    @voter = Voter.find(cookies[:voter_id])
    @event = Event.friendly.find(@voter.event_id)

    redirect_to event_path(@event)
  end

  private

  def voter_params
    params.require(:voter).permit(:name, :event_id, :email,
                                  votes_attributes: %i[day _destroy event_id voter_id])
  end
end
