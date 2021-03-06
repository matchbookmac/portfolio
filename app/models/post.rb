class Post < ActiveRecord::Base
  has_many :posts
  belongs_to :post
  belongs_to :user

  validates :user_id, presence: true
  validates :content, presence: true

  scope :not_comments, -> { where(comment: false) }
end
