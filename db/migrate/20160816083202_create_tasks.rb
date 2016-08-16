class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :description
      t.integer :estimated_pomodoro
      t.boolean :done_flg
      t.references :parent_task, foreign_key: {to_table: :tasks}
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
