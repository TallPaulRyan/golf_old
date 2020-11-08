class CreateScores < ActiveRecord::Migration[5.2]
  def change
    create_table :scores do |t|
      t.integer :golfer_id
      t.integer :course_id
      t.integer :hole1
      t.integer :hole2
      t.integer :hole3

      t.timestamps
    end
  end
end
