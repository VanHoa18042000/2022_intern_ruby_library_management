class Order < ApplicationRecord
  FIELD_PERMIT = %i(user_id approval note_user note_admin date_start date_return).freeze
  enum approval: {pending: 0, approved: 1}

  has_many :order_details, dependent: :destroy
  belongs_to :user, -> { select %i(id name) }

  # validates :name, presence: true, length: {minimum: Settings.author.min}
  # validates :description, presence: true,

  scope :latest, ->{order updated_at: :desc}
end
