class AddColumnsToBadges < ActiveRecord::Migration[5.2]
  def change
    add_column :badges, :category, :string
    add_column :badges, :level, :integer
  end
end
