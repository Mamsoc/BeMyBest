class Project < ApplicationRecord
  belongs_to :user
  belongs_to :scenarios, optional: true
  has_one_attached :photo
end
