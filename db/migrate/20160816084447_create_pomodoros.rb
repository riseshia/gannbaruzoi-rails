class CreatePomodoros < ActiveRecord::Migration[5.0]
  def change
    create_table :pomodoros do |t|
      t.references :task, foreign_key: true

      t.timestamps
    end
  end
end
