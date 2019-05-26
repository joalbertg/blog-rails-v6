# frozen_string_literal: true

# Article
class Article < ApplicationRecord
  attr_accessor :category_elements

  belongs_to :user

  has_many :has_categories
  has_many :categories, through: :has_categories

  has_rich_text :content

  def self.with_content
    includes(:rich_text_content).select(:id, :title, :created_at)
  end

  def save_categories
    return has_categories.destroy_all if category_elements.blank?

    has_categories.where.not(category_id: category_elements).destroy_all

    category_elements.each do |category_id|
      HasCategory.find_or_create_by(article: self, category_id: category_id)
    end
  end
end
