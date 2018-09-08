class AddReferenceAnswerToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_reference :answers, :question, foreign_key: true
    change_column_default :answers, :correct, false
    add_column :users, :name, :string, column_options: { null: false }
    add_column :users, :email, :string, column_options: { null: false }
  end
end
