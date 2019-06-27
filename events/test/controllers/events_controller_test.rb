require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
	setup do
		@event = events(:one)
	end

	test "should get index" do
		get events_url
		assert_response :success
	end

	test "should get new" do
		get new_event_url
		assert_response :success
	end

	test "should not create event" do
		assert_no_difference('Event.count') do
			post events_url, params: { event: { title: "New Event", description: "", date: "2049-06-05 15:54:49", address: "Germany" } }
		end

		assert_response :success
	end

	test "should show event" do
		get event_url(@event)
		assert_response :success
	end

	test "should no get edit" do
		get edit_event_url(@event)
		assert_redirected_to root_path
	end

	test "should not update event" do
		patch event_url(@event), params: { event: {  } }
		assert_redirected_to root_path
	end

	test "should not destroy event" do
		assert_no_difference('Event.count', -1) do
			delete event_url(@event)
		end

		assert_redirected_to root_path
	end
end
