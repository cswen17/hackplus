class Task < ActiveRecord::Base
  attr_accessible :completed, :description, :name, :duetime, :user
  validates :name, presence: true, length: {maximum:60}
  validates :description, presence: true, length: {maximum:1000}

  belongs_to :user

end
