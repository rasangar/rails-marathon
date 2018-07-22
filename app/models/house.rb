class House < ApplicationRecord
  validates :name, :author, :source, presence: true

  has_many :members
end
