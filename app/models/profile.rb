class Profile < ActiveRecord::Base
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :projects

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :bio, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end
end
