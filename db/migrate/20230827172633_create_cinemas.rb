class CreateCinemas < ActiveRecord::Migration[7.0]
  def change
    create_table :cinemas do |t|
      t.string :cinema_type
      t.string :cine_name
      t.string :contact_no
      t.string :city


      t.timestamps
    end
  end
end
