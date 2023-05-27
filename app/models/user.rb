class User < ApplicationRecord
  has_many :payments
  has_many :groups

  validates :name, presence: true, length: { maximum: 50 }
end
