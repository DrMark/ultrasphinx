require File.dirname(__FILE__) + '/../test_helper'
require 'sellers_controller'

# Re-raise errors caught by the controller.
class SellersController; def rescue_action(e) raise e end; end

class SellersControllerTest < Test::Unit::TestCase
  fixtures :sellers

  def setup
    @controller = SellersController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def test_should_get_index
    get :index
    assert_response :success
    assert assigns(:sellers)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_seller
    assert_difference('Seller.count') do
      post :create, :seller => { :user_id => 1 }
    end

    assert_redirected_to seller_path(assigns(:seller))
  end

  def test_should_show_seller
    get :show, :id => 1
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => 1
    assert_response :success
  end

  def test_should_update_seller
    put :update, :id => 1, :seller => { }
    assert_redirected_to seller_path(assigns(:seller))
  end

  def test_should_destroy_seller
    new_user = User.create(:login => 'test', :email => 'test@test.com')
    new_seller = Seller.new(:user_id => new_user.id, :company_name => 'test')
    
    assert_difference('Seller.count', +1) do
      new_seller.save
    end

    assert_difference('Seller.count', -1) do
      delete :destroy, :id => new_seller.id
    end

    assert_redirected_to sellers_path
  end
end
