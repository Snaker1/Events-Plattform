require 'test_helper'

class RsvpmailerMailerTest < ActionMailer::TestCase
		test "invite" do
			# Create the email and store it for further assertions
			email = RsvpmailerMailer.rsvp_email(users(:one),
																			 @event = events(:one))
			# Send the email, then test that it got queued
			assert_emails 1 do
				email.deliver_now
			end
			assert_equal 'Someone RSVPed to your event!', email.subject
	end
end
