class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         authentication_keys: [:name]
         

  has_many :books,dependent: :destroy
  has_one_attached :profile_image

  validates :name, length: {minimum:2}


  def profile_image_for(width, height)
    return 'no_image.jpg' unless profile_image.attached?
    profile_image.variant(resize_to_limit: [width, height]).processed
  end
  
end
