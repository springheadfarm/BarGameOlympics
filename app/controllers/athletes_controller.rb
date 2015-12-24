class AthletesController < ApplicationController
  def index
    @athletes = Athlete.all
  end

  def show
    @athlete = Athlete.find(params[:id])
  end

  def new
    @athlete = Athlete.new
  end

  def create
    @athlete = Athlete.new(params[:athlete])
    if @athlete.save
      redirect_to @athlete, :notice => "Successfully created athlete."
    else
      render 'new'
    end
  end

  def edit
    @athlete = Athlete.find(params[:id])
  end

  def update
    @athlete = Athlete.find(params[:id])
    if @athlete.update_attributes(params[:athlete])
      redirect_to @athlete, :notice  => "Successfully updated athlete."
    else
      render 'edit'
    end
  end

  def destroy
    @athlete = Athlete.find(params[:id])
    @athlete.destroy
    redirect_to athletes_url, :notice => "Successfully destroyed athlete."
  end
end
