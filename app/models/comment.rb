class Comment < ApplicationRecord
  belongs_to :item
  belongs_to :user

  validates :text, presence: true, length: { minimum: 1, maximum: 200 }
end
