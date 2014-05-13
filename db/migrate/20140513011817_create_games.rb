class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :level
      t.integer :guesses
      t.string :generated_number
      t.string :status
      t.timestamps null: false
    end
  end
end
