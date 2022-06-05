class Card < ApplicationRecord
  belongs_to :scenario
  has_many :memories
end
