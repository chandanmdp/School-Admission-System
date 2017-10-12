class Appointment < ApplicationRecord
  belongs_to :candidate

  validates :candidate_id, uniqueness: { message: "You have already scheduled an appointment" }
  validate :valid_date
  validates :venue, presence: true, length: { minimum: 10 }

  private

  def valid_date
    if datetime < Time.now
      errors.add(:base, "Appointment can't be in the past")
    end
  end

end
