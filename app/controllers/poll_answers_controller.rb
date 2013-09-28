class PollAnswersController < ApplicationController
  def index
    @poll_answers = PollAnswer.all
  end

  def show
    @poll_answer = PollAnswer.find(params[:id])
  end

  def new
    @poll_answer = PollAnswer.new
  end

  def create
    @poll_answer = PollAnswer.new(params[:poll_answer])
    if @poll_answer.save
      redirect_to @poll_answer, :notice => "Successfully created poll answer."
    else
      render :action => 'new'
    end
  end

  def edit
    @poll_answer = PollAnswer.find(params[:id])
  end

  def update
    @poll_answer = PollAnswer.find(params[:id])
    if @poll_answer.update_attributes(params[:poll_answer])
      redirect_to @poll_answer, :notice  => "Successfully updated poll answer."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @poll_answer = PollAnswer.find(params[:id])
    @poll_answer.destroy
    redirect_to poll_answers_url, :notice => "Successfully destroyed poll answer."
  end
end
