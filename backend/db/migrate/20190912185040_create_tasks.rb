class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :description
      t.string :link
      t.string :image
      t.string :category

      t.timestamps
    end
  end
end
