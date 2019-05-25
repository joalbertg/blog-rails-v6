# frozen_string_literal: true

# ArticlesController
class ArticlesController < ApplicationController
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
end
