class Dog < ApplicationRecord
  validates :name, presence: true
  validates :breed, presence: true
  validates :age, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, presence: true
end
