class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.string :name
      t.date :birthday
      t.datetime :date
      t.string :attachment

      t.timestamps null: false
    end
  end
end
