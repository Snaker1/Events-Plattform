class RsvpmailerMailer < ApplicationMailer
	default from: 'notifications@example.com'
	layout 'mailer'
  def rsvp_email(user,event)
      @user = user
      @event = event
      @url  = 'http://www.gmail.com'
      mail(to:@event.user.email, subject: 'Someone RSVPed to your event!')
  end
  def event_reminder_email(user,event)
      @user = user
      @event = event
      @url  = 'http://www.gmail.com'
      mail(to:@user.email, subject: 'The Event starts in one day!')
  end
end
