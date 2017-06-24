class Task < ActiveRecord::Base
  belongs_to :list

  scope :today, -> { where("created_at >=?", Time.now.beginning_of_day)}
  scope :ten_most_recent, -> { order(created_at: :desc).limit(10)}

  validates :description, :presence => true

  def self.done
    Task.where({done: true})
  end

  def self.not_done
    where(done: false)
  end
end
