class AddColoumnsIntoTodo < ActiveRecord::Migration[6.1]
  def change
    add_column :todos, :priority, :integer, null: false, default: 1
    add_column :todos, :due_date, :date
  end
end
