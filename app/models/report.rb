# frozen_string_literal: true

class Report < ApplicationRecord
  has_many :comments, as: :commentable
  paginates_per 5
  validates :title, presence: true
end
