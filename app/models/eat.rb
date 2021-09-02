class Eat < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one_attached :image

  with_options presence: true do
    validates :title
    validates :category
    validates :price
    validates :detail
    validates :image
  end
end
