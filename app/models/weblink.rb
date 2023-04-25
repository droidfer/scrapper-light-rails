class Weblink < ApplicationRecord
  belongs_to :web

  def display_name
    return "No Name: #{url}" unless name
    name
  end
end
