class InfoController < ApplicationController
  def about
  end

  def home
  	@photo = Photo.random
  end

  def tickets
  	#render layout: 'blank'
  end
end
