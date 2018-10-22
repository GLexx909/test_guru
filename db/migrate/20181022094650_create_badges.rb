class CreateBadges < ActiveRecord::Migration[5.2]
  def change
    create_table :badges do |t|
      t.string :name, null: false, unique: true
      t.string :img, null: false, unique: true

      t.timestamps
    end
  end
end
