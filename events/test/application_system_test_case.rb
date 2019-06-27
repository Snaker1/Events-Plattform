require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
	driven_by :selenium, using: :chrome, screen_size: [800, 640]
	test 'event pages display map' do
		visit event_url(Event.first)
		assert_selector "#map"
		page.assert_selector('.leaflet-marker-icon')
		first('.leaflet-marker-icon').click
	end

end
