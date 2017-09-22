class Eligibility < ApplicationRecord

  validates :title, :criteria, presence: true
  validates :title, :criteria, length: { minimum:5 }

end
