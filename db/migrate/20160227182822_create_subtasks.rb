class CreateSubtasks < ActiveRecord::Migration[5.0]
  def change
    create_table :subtasks do |t|
      t.string :name
      t.belongs_to :task, foreign_key: true, index: true

      t.timestamps
    end
  end
end
