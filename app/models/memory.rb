class Memory < ApplicationRecord
  belongs_to :user
  belongs_to :card, optional: true
  belongs_to :project
  has_one_attached :photo
end
