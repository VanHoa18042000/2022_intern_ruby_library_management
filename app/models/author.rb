class Author < ApplicationRecord
  FIELD_PERMIT = %i(name gender dob description image).freeze
  enum gender: {male: 1, female: 0, other: 2}

  has_many :books, dependent: :destroy
  has_one_attached :image

  validates :name, presence: true, length: {minimum: Settings.author.min}
  validates :gender, presence: true
  validates :dob, presence: true
  validates :description, presence: true,
            length: {minimum: Settings.author.min}
  validates :image, content_type: {in: Settings.author.image_type},
                    size: {less_than: Settings.author.image_size.megabytes}

  scope :latest, ->{order created_at: :desc}

  def display_image
    image.filename.present? ? image : Settings.user.avatar_default
  end
end
