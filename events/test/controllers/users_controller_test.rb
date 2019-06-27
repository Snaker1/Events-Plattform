require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
	setup do
		@user = users(:one)
	end

	test "should not get index" do
		get users_url
		assert_redirected_to root_path
	end

	test "should get new" do
		get new_user_url
		assert_response :success
	end

	test "should create user" do
		assert_difference('User.count') do
			post users_url, params: { user: { name: "Theo Test", email: "test@test123a.de", password: 'foofoo', password_confirmation: 'foofoo'  } }
		end

		assert_redirected_to root_path
	end
	test "should not create user cause wrong email format" do
		assert_no_difference('User.count') do
			post users_url, params: { user: { name: "Theo Test", email: "testtest123a.de", password: 'foofoo', password_confirmation: 'foofoo'  } }
		end

		assert_response :success
	end
	test "should not create user cause not matching pw" do
		assert_no_difference('User.count') do
			post users_url, params: { user: { name: "Theo Test", email: "testtest123a.de", password: 'foofoo', password_confirmation: 'barbar'  } }
		end

		assert_response :success
	end

	test "should show user" do
		get user_url(@user)
		assert_response :success
	end

	test "should not get edit" do
		get edit_user_url(@user)
		assert_redirected_to root_path
	end

	test "should not update user" do
		patch user_url(@user), params: { user: {  } }
		assert_redirected_to root_path
	end

	test "should not destroy user" do
		assert_no_difference('User.count', -1) do
			delete user_url(@user)
		end

		assert_redirected_to root_path
	end

end
