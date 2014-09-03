require 'test_helper'

class ItemControllerTest < ActionController::TestCase
  test "should get name:string" do
    get :name:string
    assert_response :success
  end

  test "should get price:float" do
    get :price:float
    assert_response :success
  end

  test "should get category:references" do
    get :category:references
    assert_response :success
  end

end
