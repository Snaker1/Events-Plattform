class RsvpController < ApplicationController
	def new
		@rsvp = Rsvp.new
	end
	def create
		@user = User.find_by_id(params[:user])
		@event = Event.find_by_id(params[:event])
		@rsvp = Rsvp.new({event: @event ,user: @user})
		if @rsvp.save
			RsvpmailerMailer.rsvp_email(@user,@event).deliver_later
			RsvpmailerMailer.event_reminder_email(@user,@event).deliver_later(wait_until: @event.date - 1.day)
			flash[:notice] = "RSVP sucessfull!"
		end
		redirect_to events_path
	end
	private
    ## Use callbacks to share common setup or constraints between actions.
    def set_rsvp
      @rsvp = rsvp.find(params[:id])
    end

    ## Never trust parameters from the scary internet, only allow the white list through.
    def rsvp_params
      params.fetch(:rsvp, {}).permit(:user, :event)
    end
end
