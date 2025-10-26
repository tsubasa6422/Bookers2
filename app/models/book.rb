class Book < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true

  validates :body, length: {maximum:200}

  before_validation do
    self.title   = title.to_s.strip
    self.body = body.to_s.strip
  end
  
end
