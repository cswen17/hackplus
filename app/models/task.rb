class Task < ActiveRecord::Base
  attr_accessible :completed, :description, :name, :duetime, :length, :interest, :user
  validates :name, presence: true, length: {maximum:60}
  validates :description, presence: true, length: {maximum:1000}
  validates :interest, presence: true
  validates :length, presence: true


  belongs_to :user

end
