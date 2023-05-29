class Payment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :groups, through: :group_payments

  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :author_id, presence: true
  validates :group_id, presence: true
end
