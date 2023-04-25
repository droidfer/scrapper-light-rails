class Web < ApplicationRecord
  has_many :weblinks
  
  validates :url, presence: true
  validates :url, format: { with: URI::regexp }
  
  enum :status, [ :process, :success, :fail ]
  
  def display_name
    return "#{url}" unless finished_at
    return "No Title: #{url}" unless name.present? 
    name
  end
  
  def display_total
    return "in progress" unless finished_at
    return "error" if fail?
    total
  end
end
