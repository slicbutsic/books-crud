class Book < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  
  has_many :comments, dependent: :destroy
  validates :title, presence: true, uniqueness: true
  validates :body, presence: true, length: { minimum: 5 }

end
