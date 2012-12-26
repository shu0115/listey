class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :user_id
      t.text :content
      t.integer :sort
      t.integer :group_id
      t.string :status

      t.timestamps
    end
  end
end
