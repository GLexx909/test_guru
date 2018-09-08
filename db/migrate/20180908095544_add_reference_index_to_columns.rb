class AddReferenceIndexToColumns < ActiveRecord::Migration[5.2]
  def change
    change_column_null :answers, :correct, false
    add_foreign_key :tests, :categories
  end
end
