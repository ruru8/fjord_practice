class Report < ApplicationRecord
  has_many :comments, as: :commentable
<<<<<<< HEAD
  validates :title, presence: true
=======
  paginates_per 5
>>>>>>> 7ea5e009bfd4dd2e5fc9dcbdac5a1156d1b89f14
end
