class Book < ApplicationRecord
  mount_uploader :picture, PictureUploader
  has_many :comments, as: :commentable
  paginates_per 5
end
