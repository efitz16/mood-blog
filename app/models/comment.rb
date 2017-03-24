class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  validates :body, presence: true
  validates :post, presence: true

  # validtes :check_blank

  # def check_blank
  # 	if self.body
  # end
end
