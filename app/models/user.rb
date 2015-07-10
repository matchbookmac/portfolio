class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :categories
  has_and_belongs_to_many :projects
  has_many :posts

  validates :first_name, presence: true
  validates :last_name, presence: true

  def projects_with_category(category)
    return_projects = []
    projects.each do |project|
      return_projects.push(project) if project.categories.include?(category)
    end
    return_projects
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
