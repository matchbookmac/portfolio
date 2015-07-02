class Profile < ActiveRecord::Base
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :projects

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :bio, presence: true

  def projects_with_category(category)
    return_projects = []
    projects.each do |project|
# binding.pry
      return_projects.push(project) if project.categories.include?(category)
    end
    return_projects
  end

  # pro.categories.joins(:projects).where(id: 6) pro.categories.joins(:projects).where(id: category.id)
  # Category.joins(:projects).where(projects: { categories: category }) }
  # Category.joins(:projects).where(projects: { category: category })

  def full_name
    "#{first_name} #{last_name}"
  end
end
