class CreateAnalyses < ActiveRecord::Migration[8.1]
  def change
    create_table :analyses do |t|
      t.string :column_name
      t.string :operation
      t.references :upload, null: false, foreign_key: true

      t.timestamps
    end
  end
end
