class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def show
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(params[:article])
      @article.save
      redirect_to @article
    else
      render 'edit'
    end
  end


  def create
    @article = Article.new(params[:article])
    if @article.save
      redirect_to articles_url, :notice => "Successfully created article."
    else
      render 'new'
    end
  end
end
