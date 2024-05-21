class ArticlesController < ApplicationController
  before_action :set_article , only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    article = Article.new(params_article)
    article.save
    redirect_to articles_path
  end

  def edit

  end

  def update
    @article.update(params_article)
    redirect_to article_path
  end

  def destroy
    @article.destroy
    redirect_to articles_path, notice: "Article was successfully destroyed", status: :see_other
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def params_article
    params.require(:article).permit(:title, :content)
  end



end
