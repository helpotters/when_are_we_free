class VotersController < ApplicationController
  def new; end

  def notify
    @voter = Voter.find(cookies[:voter_id])
  end

  def create
    @event = Event.friendly.find(params[:voter][:event_id])
    @voter = @event.voters.create(voter_params)

    respond_to do |format|
      if @voter.save
        cookies[:voter_id] = @voter.id
        flash.now[:success] = 'New party member added!'
        format.turbo_stream { update_friends }
        format.html { redirect_to notify_path(@voter) }
        format.json { render json: @voter, status: :ok }
      else
        flash.now[:error] = 'Something went wrong! D: '
        format.turbo_stream { render_flash }
        format.html { redirect_to event_path(@event) }
        format.json { render json: @voter.errors, status: unprocessable_entity }
      end
    end
  end

  def update
    @voter = Voter.find(cookies[:voter_id])
    @event = Event.friendly.find(@voter.event_id)

    respond_to do |format|
      if @voter.update(voter_params)
        flash[:success] = 'Email added'
        format.turbo_stream { render_flash }
        format.html { redirect_to next_path(@event) }
      else
        flash[:error] = 'Email failed'
        format.turbo_stream { render_flash }
        format.html { redirect_to notify_path(@voter) }
      end
    end
  end

  private

  def voter_params
    params.require(:voter).permit(:name, :event_id, :email,
                                  votes_attributes: %i[day _destroy event_id voter_id])
  end
end
