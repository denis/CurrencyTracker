require 'test_helper'

class CountriesControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  should_not_respond_to_actions :new => :get,
                                :destroy => :get,
                                :create => :post,
                                :edit => :get,
                                :update => :put

  setup do
    sign_in users(:one)
    @country = countries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:countries)
  end

  test "should show country" do
    get :show, :id => @country.to_param
    assert_response :success
  end
end