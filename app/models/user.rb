class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :eats
  has_many :comments, dependent: :destroy

          validates :nickname, presence: true
          validates :profile, presence: true
  end
