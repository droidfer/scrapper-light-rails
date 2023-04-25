class Web < ApplicationRecord
  has_many :weblinks
  
  validates :url, presence: true
  
  def display_name
    return "No Title: #{url}" unless name.present? 
    name
  end
end
