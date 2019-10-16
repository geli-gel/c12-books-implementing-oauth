class AddPublicationDateAsDatetime < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :publication_date, :datetime
  end
end
