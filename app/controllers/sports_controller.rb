class SportsController < ApplicationController
  def index
    @sports = Sport.all
  end

  def show
    @sport = Sport.find(params[:id])
  end

  def new
    @sport = Sport.new
  end

  def create
    @sport = Sport.new(params[:sport])
    if @sport.save
      redirect_to @sport, :notice => "Successfully created sport."
    else
      render :action => 'new'
    end
  end

  def edit
    @sport = Sport.find(params[:id])
  end

  def update
    @sport = Sport.find(params[:id])
    if @sport.update_attributes(params[:sport])
      redirect_to @sport, :notice  => "Successfully updated sport."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @sport = Sport.find(params[:id])
    @sport.destroy
    redirect_to sports_url, :notice => "Successfully destroyed sport."
  end
end
