class Author < ApplicationRecord
  FIELD_PERMIT = %i(name gender dob description image).freeze
  has_many :books, dependent: :destroy
  has_one_attached :image

  scope :latest_author, ->{order created_at: :desc}

  validates :name, presence: true, length: {minimum: Settings.author.min}
  validates :description, presence: true,
            length: {minimum: Settings.author.min}
  validates :image, content_type: {in: Settings.author.image_type},
                    size: {less_than: Settings.author.image_size.megabytes}

  def display_image
    if image.filename.present?
      image
    else
      Settings.user.avatar_default
    end
  end
end
