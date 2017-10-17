class Candidate < ApplicationRecord

  has_one :appointment, dependent: :destroy
  has_many :payments, dependent: :destroy
  belongs_to :section
  belongs_to :user

  has_attached_file :image, styles: { thumb: "100x100#" }
  has_attached_file :marksheet, styles: { ex_large: "1000x1000>", medium: "300x300>" }

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates_attachment_content_type :marksheet, content_type: /\Aimage\/.*\z/
  validates :name, :father_name, :mother_name , presence: true, length: { maximum: 50 }
  validates :education, :contact_address, :parent_contact_number,:image, presence: true
  validates :parent_contact_number,:alternate_parent_contact_number, numericality: true, format: { with: /\A[789]\d{9}\z/ }
  validates_size_of :image, :marksheet,  maximum: 2.megabytes
  validate :rejection_reason_error
  validate :grade_presence


  def rejection_reason_error
    if (admission_status == "Selected" || admission_status == "Accepted" || admission_status == "Under Process")  && rejection_reason.present?
      errors.add(:rejection_reason, ": There can't be any rejection reason if the candidate is not rejected")
    end
    if admission_status == "Rejected" && !rejection_reason.present?
      errors.add(:rejection_reason, " Add rejection reason.")
    end
  end

  def grade_presence
    if admission_status == "Selected"
      unless grade.present?
        errors.add(:grade, " Please specify the grade in which candidate got admission")
      end
    else
      if grade.present?
        errors.add(:grade, " Grade can't be there if the candidate is not selected for admission")
      end
    end
  end

end
