class CreateIssues < ActiveRecord::Migration[5.0]
  def change
    create_table :issues do |t|
      t.string :name, :status
      t.belongs_to :subtask, foreign_key: true, index: true

      t.timestamps
    end
  end
end
