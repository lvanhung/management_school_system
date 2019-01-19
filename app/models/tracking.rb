class Tracking < ActiveRecord::Base
  belongs_to :_class, class_name: SchoolClass, foreign_key: 'class_id'

  def class_name
    _class.name
  end

  def teacher_name
    _class.teacher_name
  end

end
