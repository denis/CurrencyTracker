require 'test_helper'

class VisitsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    sign_in users(:one)
    @country = countries(:one)
  end

  test "should create visit" do
    assert_difference('Visit.count') do
      post :create, :country_id => @country.to_param
    end

    assert_redirected_to country_path(assigns(:country))
  end

  test "should destroy visit" do
    Visit.create :country => @country, :user => users(:one)

    assert_difference('Visit.count', -1) do
      delete :destroy, :country_id => @country.to_param
    end

    assert_redirected_to country_path(assigns(:country))
  end
end
