class Payment < ApplicationRecord
  belongs_to :candidate

  has_attached_file :payment_image, styles: { medium: "600x600>" }

  validates_attachment_content_type :payment_image, content_type: /\Aimage\/.*\z/
  validates :payment_status, :payment_image, :payment_mode, :amount, presence: true
  validates :amount, numericality: { only_integer: true }

end
