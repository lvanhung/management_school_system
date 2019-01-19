# class is same syntax ruby so we can't be named a class like this
class SchoolClass < ActiveRecord::Base
  has_many :trackings, foreign_key: 'class_id'

  belongs_to :teacher, class_name: User

  def teacher_name
    teacher.name
  end

  def teacher?(_class)
    true
  end
end
