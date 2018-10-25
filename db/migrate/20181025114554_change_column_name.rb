class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :badges, :category, :rule_type
    change_column :badges, :level, :string
    rename_column :badges, :level, :param
  end
end
