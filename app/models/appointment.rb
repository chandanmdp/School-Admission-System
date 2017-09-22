class Appointment < ApplicationRecord
  belongs_to :user

  validates :user_id, uniqueness:{message: ",You have already scheduled an appointment"}
  validate :valid_date

  private

  def valid_date
    if datetime < Time.now
      errors.add(:base, "Appointment can't be in the past")
    end
  end

end
