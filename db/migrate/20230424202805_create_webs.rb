class CreateWebs < ActiveRecord::Migration[7.0]
  def change
    create_table :webs do |t|
      t.string :name
      t.string :url
      t.date :finished_at
      t.integer :total
      t.integer :status , default: 0 

      t.timestamps
    end
  end
end
