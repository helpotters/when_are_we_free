class VotersController < ApplicationController
  def new; end

  def create
    @event = Event.find(params[:voter][:event_id])
    @voter = @event.voters.build(voter_params)

    respond_to do |format|
      if @voter.save
        format.html { redirect_to event_path(@voter.event_id, notice: 'successfuly shared availability') }
        format.json { render json: @voter, status: :ok }
      else
        format.html { redirect_to event_path(@voter.event_id) }
        format.json { render json: @voter.errors, status: unprocessable_entity }
      end
    end
  end

  private

  def voter_params
    params.require(:voter).permit(:name, :event_id)
  end
end
