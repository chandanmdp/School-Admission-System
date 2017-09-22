class Payment < ApplicationRecord
  belongs_to :user

  has_attached_file :payment_image, styles: { medium: "600x600>" }

  validates_attachment_content_type :payment_image, content_type: /\Aimage\/.*\z/
  validates :payment_name, presence: true, length: { minimum: 5 }
  
end
