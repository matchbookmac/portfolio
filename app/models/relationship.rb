class Relationship < ActiveRecord::Base
  belongs_to :user, class_name: :User
  belongs_to :reference, class_name: :User

  validates :relationship, presence: true
end
