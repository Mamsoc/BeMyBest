class Memory < ApplicationRecord
  belongs_to :user
  belongs_to :card, optional: true
  belongs_to :project
  has_one_attached :photo
  validate :memories_limit

  def memories_limit
    if project.user != user && project.memories.where(user: user).count >= 3
      errors.add(:photo, :blank, message: ": pas plus de 3 par projet")
    end
  end
end
