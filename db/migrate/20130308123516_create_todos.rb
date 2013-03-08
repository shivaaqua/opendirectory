class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :task, :null => false,  :limit => 50
      t.boolean :completed, :default => false, :null => false
      t.timestamps
    end
  end
end
