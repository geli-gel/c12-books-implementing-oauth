class RemovePublicationDateAsInt < ActiveRecord::Migration[5.2]
  def change
    remove_column :books, :publication_date
  end
end
