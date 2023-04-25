class Web < ApplicationRecord
  has_many :weblinks
  
  validates :url, presence: true
end
