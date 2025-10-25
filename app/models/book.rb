class Book < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :opinion, presence: true

  validates :opinion, length: {maximum:200}

  before_validation do
    self.title   = title.to_s.strip
    self.opinion = opinion.to_s.strip
  end
  
end
