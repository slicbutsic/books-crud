class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :reviews, presence: true
end
