require 'test_helper'

class SportsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Sport.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Sport.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Sport.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to sport_url(assigns(:sport))
  end

  def test_edit
    get :edit, :id => Sport.first
    assert_template 'edit'
  end

  def test_update_invalid
    Sport.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Sport.first
    assert_template 'edit'
  end

  def test_update_valid
    Sport.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Sport.first
    assert_redirected_to sport_url(assigns(:sport))
  end

  def test_destroy
    sport = Sport.first
    delete :destroy, :id => sport
    assert_redirected_to sports_url
    assert !Sport.exists?(sport.id)
  end
end
