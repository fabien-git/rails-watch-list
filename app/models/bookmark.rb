class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list
  belongs_to :review
  validates :comment, length: { minimum: 6 }
  validates :movie_id, uniqueness: { scope: :list_id, message: "Allready in bookmark" }
  validates :comment, presence: true
end
