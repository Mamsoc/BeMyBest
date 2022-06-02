class Project < ApplicationRecord
  belongs_to :user
  belongs_to :scenario, optional: true
  has_one_attached :photo
end
