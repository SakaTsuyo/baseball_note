class CreateTweets < ActiveRecord::Migration[6.1]
  def change
    create_table :tweets do |t|
      t.text :objective
      t.text :practice
      t.text :learned
      t.text :body
      t.datetime :date
      t.references :student, null: false, foreign_key: true

      t.timestamps
    end
  end
end
