class Post < ApplicationRecord
  belongs_to :user

  validates :user, :body, presence: true

  validates :title, within: 0..255, :too_long => "Title too long"
end
