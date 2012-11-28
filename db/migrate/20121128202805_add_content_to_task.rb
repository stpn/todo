class AddContentToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :content, :text
  end
end
