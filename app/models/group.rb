class Group < ApplicationRecord
  has_many :payments
  belongs_to :user

  validates :name, presence: true, length: { maximum: 50 }
  validates :user_id, presence: true
  validates :icon, presence: true
end
