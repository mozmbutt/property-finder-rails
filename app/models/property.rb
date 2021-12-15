class Property < ApplicationRecord
  has_one_attached :photo
  belongs_to :account

  scope :latest, -> { order created_at: :desc }
end
