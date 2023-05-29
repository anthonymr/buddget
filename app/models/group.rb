class Group < ApplicationRecord
  has_one_attached :icon
  has_many :payments, through: :group_payments
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  validates :name, presence: true, length: { maximum: 50 }
  validates :author_id, presence: true

  def total_amount
    payments.where(author_id:).sum(:amount)
  end
end
