class List < ActiveRecord::Base
  has_many :tasks
  validates :name, :presence => true
  scope :name, -> (name_parameter) { where(name: name_parameter) }
  scope :search, -> (name_parameter) { where("name_parameter like ?", "%#{name_parameter}%")}


  scope :most_tasks, -> {(
    select("lists.name, lists.description, count(tasks.id) as tasks_count")
    .joins(:tasks)
    .group("lists.id")
    .order("tasks_count DESC")
    .limit(10)
    )}
end
