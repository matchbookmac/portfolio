class Project < ActiveRecord::Base
  has_and_belongs_to_many :profiles
  has_and_belongs_to_many :categories

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :description, presence: true
end