require 'test_helper'

class AthletesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Athlete.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Athlete.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Athlete.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to athlete_url(assigns(:athlete))
  end

  def test_edit
    get :edit, :id => Athlete.first
    assert_template 'edit'
  end

  def test_update_invalid
    Athlete.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Athlete.first
    assert_template 'edit'
  end

  def test_update_valid
    Athlete.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Athlete.first
    assert_redirected_to athlete_url(assigns(:athlete))
  end

  def test_destroy
    athlete = Athlete.first
    delete :destroy, :id => athlete
    assert_redirected_to athletes_url
    assert !Athlete.exists?(athlete.id)
  end
end
