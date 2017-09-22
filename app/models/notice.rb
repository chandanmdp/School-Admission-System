class Notice < ApplicationRecord

  validates :notice_title, :content, presence: true
  validates :notice_title, :content, length: { minimum:5 }

end
