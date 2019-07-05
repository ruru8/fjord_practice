# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  paginates_per 5
  validates :name, presence: true
end
