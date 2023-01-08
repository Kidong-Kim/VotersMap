class CreateRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :ratings do |t|
      t.string :rate
      t.string :title
      t.string :representative_id

      t.timestamps
    end
  end
end
