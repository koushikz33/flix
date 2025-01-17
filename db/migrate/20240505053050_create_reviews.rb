class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.string :name
      t.integer :stars
      t.string :comment
      t.references :movie, null: false, foreign_key: true

      t.timestamps
    end
  end
end
