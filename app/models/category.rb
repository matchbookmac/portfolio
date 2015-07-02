class Category < ActiveRecord::Base
  validates :language, presence: true
  validates :language, uniqueness: true
  validates :description, presence: true
end
