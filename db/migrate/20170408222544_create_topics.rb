class CreateTopics < ActiveRecord::Migration[5.0]
  def change
    create_table :topics do |t|
      t.string :name
      t.integer :points
      t.references :user

      t.timestamps
    end
  end
end
