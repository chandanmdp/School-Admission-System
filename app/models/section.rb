class Section < ApplicationRecord
  has_many :candidates, dependent: :destroy
  has_many :fees, dependent: :destroy
  validates :section_name, uniqueness: true
  validates :section_name, :section_grades, presence: true
end
