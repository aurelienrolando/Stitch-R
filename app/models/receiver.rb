class Receiver < ApplicationRecord
  belongs_to :user
  has_many :receipts, dependent: :destroy
end
