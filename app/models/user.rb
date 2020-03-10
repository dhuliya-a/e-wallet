class User < ApplicationRecord
  has_secure_password
  has_many :wallets, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  validates :name, presence: true

  validates :username, presence: true, uniqueness: true
  validates :password,
            length: { minimum: 6 }

  def logout(user_id)
    REDIS.del("auth_#{user_id}")
  end

end

