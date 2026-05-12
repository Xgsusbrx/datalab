class AddStatusAndErrorToAnalyses < ActiveRecord::Migration[8.1]
  def change
    add_column :analyses, :status, :string
    add_column :analyses, :error_message, :text
  end
end
