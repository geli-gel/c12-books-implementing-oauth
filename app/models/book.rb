class Book < ApplicationRecord
  belongs_to :author

  validates :title, presence: true

  def self.all_in_alpha_order
    return Book.all.order(title: :asc)
  end
end
