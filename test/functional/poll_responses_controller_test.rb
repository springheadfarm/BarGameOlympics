require 'test_helper'

class PollResponsesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => PollResponse.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    PollResponse.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    PollResponse.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to poll_response_url(assigns(:poll_response))
  end

  def test_edit
    get :edit, :id => PollResponse.first
    assert_template 'edit'
  end

  def test_update_invalid
    PollResponse.any_instance.stubs(:valid?).returns(false)
    put :update, :id => PollResponse.first
    assert_template 'edit'
  end

  def test_update_valid
    PollResponse.any_instance.stubs(:valid?).returns(true)
    put :update, :id => PollResponse.first
    assert_redirected_to poll_response_url(assigns(:poll_response))
  end

  def test_destroy
    poll_response = PollResponse.first
    delete :destroy, :id => poll_response
    assert_redirected_to poll_responses_url
    assert !PollResponse.exists?(poll_response.id)
  end
end
