class Report < ApplicationRecord
  has_many :comments, as: :commentable
  paginates_per 5
end
