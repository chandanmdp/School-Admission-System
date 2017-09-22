class Section < ApplicationRecord
  has_many :candidates, dependent: :destroy
  
end
