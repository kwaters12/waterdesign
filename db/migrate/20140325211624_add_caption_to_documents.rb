class AddCaptionToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :caption, :text
  end
end
