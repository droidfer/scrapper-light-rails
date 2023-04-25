class CreateWeblinks < ActiveRecord::Migration[7.0]
  def change
    create_table :weblinks do |t|
      t.string :name
      t.string :url
      t.integer :web_id

      t.timestamps
    end
  end
end
