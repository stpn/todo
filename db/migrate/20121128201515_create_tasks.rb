class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :user_id
      t.boolean :done

      t.timestamps
    end
  end
  def down
  	drop_table :tasks
  end
end
