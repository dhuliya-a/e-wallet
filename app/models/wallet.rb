class Wallet < ApplicationRecord
  belongs_to :user
  enum currency: CURRENCY
end
