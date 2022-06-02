class Scenario < ApplicationRecord
  has_many :cards, dependent: :destroy
  has_many :projects
end
