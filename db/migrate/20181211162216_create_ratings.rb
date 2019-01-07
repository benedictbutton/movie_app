class CreateRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :ratings do |t|
      t.belongs_to :user, index: true
      t.belongs_to :movie, index: true
      t.integer :score, numericality: true,  default: 0
      t.timestamps
    end
  end
end
