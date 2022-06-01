class Project < ApplicationRecord
  belongs_to :user
  belongs_to :scenarios, optional: true
end
