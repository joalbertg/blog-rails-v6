# frozen_string_literal: true

# Article
class Article < ApplicationRecord
  belongs_to :user
  has_rich_text :content

  def self.with_content
    includes(:rich_text_content).select(:id, :title, :created_at)
  end
end
