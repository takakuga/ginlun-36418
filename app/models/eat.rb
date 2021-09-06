class Eat < ApplicationRecord
  belongs_to :user
  has_many :goods, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one_attached :image

  with_options presence: true do
    validates :title
    validates :shop_name
    validates :category
    validates :price
    validates :detail
    validates :image
  end
  def self.search(search)
    if search != ""
      Eat.where('category LIKE(?)', "%#{search}%")
    else
      Eat.all
    end
  end
end
