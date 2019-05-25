# frozen_string_literal: true

# ArticlesController
class ArticlesController < ApplicationController
  before_action :set_article, only: :show

  def show; end

  def new
    @article = Article.new
  end

  def create
    @article = Article.create(article_params)
    render json: @article
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
