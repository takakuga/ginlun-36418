class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :eat

  validates :comment, presence: true
end
