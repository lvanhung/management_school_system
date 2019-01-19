class School < ActiveRecord::Base
  has_many :classes, class_name: SchoolClass
  has_many :branches, class_name: School, foreign_key: 'parent_id'
  belongs_to :head_quater, class_name: School, foreign_key: 'parent_id'

  belongs_to :owner, foreign_key: 'owner_id', class_name: User
  belongs_to :hq_ower, foreign_key: 'hq_owner_id', class_name: User


  def owner?(school)
    true
  end

  def hq_owner?(school)
    true
  end

end
