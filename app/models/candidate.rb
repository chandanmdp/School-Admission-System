class Candidate < ApplicationRecord

  belongs_to :section
  belongs_to :user
  validate :rejection_reason_error

  has_attached_file :image, styles: { thumb: "100x100#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  has_attached_file :marksheet, styles: { ex_large: "1000x1000>", medium: "300x300>"}
  validates_attachment_content_type :marksheet, content_type: /\Aimage\/.*\z/

  scope :sorted, -> { order("admission_status DESC") }
  




  validates :name, :father_name, :mother_name , presence: true, length: {maximum: 50}
  validates :education, :contact_address, :parent_contact_number,:image, presence: true
  validates :parent_contact_number,:alternate_parent_contact_number,
                      numericality: true, length:{ is:10}
  validates_size_of :image, :marksheet,  maximum: 2.megabytes

  def rejection_reason_error
    if (admission_status == "Selected"||admission_status == "Under Process")  && rejection_reason.present?
      errors.add(:rejection_reason, ": There can't be any rejection reason if the candidate is selected for admission or whose admission is still under process")
    end
  end

end
