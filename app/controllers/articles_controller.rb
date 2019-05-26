# frozen_string_literal: true

# ArticlesController
class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index show]

  def index
    @articles = Article.with_content.all
  end

  def show; end

  def new
    @article = Article.new
  end

  def edit; end

  def create
    @article = Article.create(article_params)
    redirect_to article_path @article
  end

  def update
    if @article.update(article_params)
      redirect_to @article
    else
      render json: @article.errors
    end
  end

  def destroy
    if @article.destroy
      redirect_to articles_path
    else
      render json: @article.errors
    end
  end

  private

  def article_params
    params.require(:article).permit(
      :title,
      :content
    )
  end

  def set_article
    @article = Article.find_by(id: params[:id])
  end
end
