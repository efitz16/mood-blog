class Post < ApplicationRecord
  belongs_to :user
  has_many :comments

  validates :user, :body, presence: true

  validates :title, length: { within: 0..255, :too_long => "Title too long" }
end
