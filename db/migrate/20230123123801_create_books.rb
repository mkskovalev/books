class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :name, index: true
      t.string :author, index: true
      t.integer :date, index: true

      t.timestamps
    end
  end
end
