class Upload < ApplicationRecord
  belongs_to :user  
  has_many :analyses, dependent: :destroy
  validates :user, presence: true

end
