# frozen_string_literal: true

# Article
class Article < ApplicationRecord
  has_rich_text :content
end
