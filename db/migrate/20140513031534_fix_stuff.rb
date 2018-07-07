class FixStuff < ActiveRecord::Migration[4.2]
  def change
    create_table :games, force: true do |t|
      t.integer :level, null: false
      t.integer :guesses, default: 0, null: false
      t.string :generated_number, null: false
      t.string :status, null: false, default: "unsolved"
      t.timestamps null: false
    end
  end
end
