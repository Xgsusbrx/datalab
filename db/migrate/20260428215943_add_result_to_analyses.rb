class AddResultToAnalyses < ActiveRecord::Migration[8.1]
  def change
    add_column :analyses, :Result, :float
  end
end
