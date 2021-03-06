class Category < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_and_belongs_to_many :projects

  validates :language, presence: true
  validates :language, uniqueness: true
  validates :description, presence: true
end
