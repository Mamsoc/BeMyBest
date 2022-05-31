class Memory < ApplicationRecord
  belongs_to :user
  belongs_to :card
  belongs_to :project
end
