class Task < ActiveRecord::Base
  attr_accessible :completed, :description, :name, :duetime
  validates :name, presence: true, length: {maximum 60}
  belongs_to :user

end
