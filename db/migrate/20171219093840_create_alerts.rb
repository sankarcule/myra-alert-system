class CreateAlerts < ActiveRecord::Migration[5.1]
  def change
    create_table :alerts do |t|
      t.integer :reference_id
      t.integer :delay
      t.string :description

      t.timestamps
    end
  end
end
