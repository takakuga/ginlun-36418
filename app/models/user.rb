class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :eats
  has_many :goods, dependent: :destroy
  has_many :comments, dependent: :destroy

          validates :nickname, presence: true
          validates :profile, presence: true

  def already_gooded?(eat)
        self.goods.exists?(eat_id: eat.id)
  end
end
