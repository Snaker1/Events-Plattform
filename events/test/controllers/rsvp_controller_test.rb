require 'test_helper'

class RsvpControllerTest < ActionDispatch::IntegrationTest
	setup do
		@rsvp1 = rsvps(:one)
	end
	test "should create rsvp" do
		assert_difference('Rsvp.count') do
			post "/rsvp/create", params: { user: 1, event: 10 }
		end
		assert_redirected_to events_path
	end
	test "should not create rsvp, as user has already done so" do
		assert_no_difference('Rsvp.count') do
			post "/rsvp/create", params: { user: 1, event: 9 }
		end
		assert_redirected_to events_path
	end

end
