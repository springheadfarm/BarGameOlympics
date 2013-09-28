require 'test_helper'

class PollAnswersControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => PollAnswer.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    PollAnswer.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    PollAnswer.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to poll_answer_url(assigns(:poll_answer))
  end

  def test_edit
    get :edit, :id => PollAnswer.first
    assert_template 'edit'
  end

  def test_update_invalid
    PollAnswer.any_instance.stubs(:valid?).returns(false)
    put :update, :id => PollAnswer.first
    assert_template 'edit'
  end

  def test_update_valid
    PollAnswer.any_instance.stubs(:valid?).returns(true)
    put :update, :id => PollAnswer.first
    assert_redirected_to poll_answer_url(assigns(:poll_answer))
  end

  def test_destroy
    poll_answer = PollAnswer.first
    delete :destroy, :id => poll_answer
    assert_redirected_to poll_answers_url
    assert !PollAnswer.exists?(poll_answer.id)
  end
end
