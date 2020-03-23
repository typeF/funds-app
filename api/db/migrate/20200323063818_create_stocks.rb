class CreateStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :stocks do |t|
      t.string :symbol
      t.string :function
      t.jsonb :data

      t.timestamps
    end
  end
end
