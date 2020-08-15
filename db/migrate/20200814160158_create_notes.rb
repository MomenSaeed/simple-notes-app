class CreateNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :notes do |t|
      t.string :title
      t.text :body
      t.integer :creator_id, index: true, foreign_key: true

      t.timestamps
    end
  end
end
