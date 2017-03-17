class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy #toggle this?
  validates :username, presence: true, length: { within: 4..20, :too_long => "Username must be between 4 and 20 characters", :too_short => "Username must be between 4 and 20 characters" }
  validates :first_name, :last_name, presence: true, length: { maximum: 100 }
  validates :password, presence: true, length: { within: 6..20 }
  validates :email, presence: true, 
                    length: { maximum: 255 }, 
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+(\.[a-z\d\-]+)+\z/i }, 
                    uniqueness: { case_sensitive: false }

  before_save :downcase_email

  has_secure_password

  private

  def downcase_email
  	self.email = self.email.downcase
  end
end
