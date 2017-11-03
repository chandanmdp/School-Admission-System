class Fee < ApplicationRecord

  belongs_to :section

  validates :fee_name, :fee_amount, presence: true
  validates :fee_amount, numericality: { only_integer: true }
end
