class AddNullForAttributes < ActiveRecord::Migration[5.2]
  def change
    change_column_null :tests, :title, false
    change_column_null :questions, :body, false
    change_column_null :categories, :title, false
    change_column_null :answers, :body, false
    change_column_default :tests, :level, 0
  end

  def up
    add_column :answers, :correct, :boolean, default: true
  end
end
