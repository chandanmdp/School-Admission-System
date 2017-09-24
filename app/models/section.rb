class Section < ApplicationRecord
  has_many :candidates, dependent: :destroy
  validates :section_name, uniqueness: true

end
