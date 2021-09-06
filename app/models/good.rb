class Good < ApplicationRecord
  belongs_to :user
  belongs_to :eat

  validates_uniqueness_of :eat_id, scope: :user_id
end
