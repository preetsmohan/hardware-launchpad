class CreateHardwares < ActiveRecord::Migration
  def change
    create_table :hardwares do |t|
      t.string :name
      t.text :description
      t.datetime :checkout
      t.datetime :returned
      t.integer :deadline

      t.timestamps null: false
    end
  end
end
