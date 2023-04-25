class CreateWeblinks < ActiveRecord::Migration[7.0]
  def change
    create_table :weblinks do |t|
      t.string :name
      t.string :url
      t.belongs_to :web

      t.timestamps
    end
  end
end
