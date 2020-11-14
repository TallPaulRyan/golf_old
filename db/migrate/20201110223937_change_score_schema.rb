class ChangeScoreSchema < ActiveRecord::Migration[5.2]
  def change
    
    create_table :courses do |t|
      t.string :name
      t.integer :holes, :par
      t.timestamps
    end

    create_table :course_details do |t|
      t.integer :hole_number, :hole_par
      t.references :course, foreign_key: true
      t.timestamps
    end
    
    change_table :scores do |t|
      t.remove :hole1, :hole2, :hole3, :golfer_id, :course_id
      t.integer :hole_number, :hole_score
      t.references :course, foreign_key: true
      t.references :user, foreign_key: true
    end
  
  end

end
