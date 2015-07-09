class Project < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_and_belongs_to_many :categories

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :description, presence: true
  validates :repo_URL, presence: true
end
