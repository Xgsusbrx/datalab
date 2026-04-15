class RemoveUploadFromAnalysis < ActiveRecord::Migration[8.1]
  def change
    remove_reference :analyses, :upload, null: false, foreign_key: true
  end
end
