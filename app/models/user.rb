class User < ActiveRecord::Base
  has_one :school, foreign_key: 'owner_id'
  has_many :schools, foreign_key: 'hq_owner_id'
  has_one :_class, class_name: SchoolClass, foreign_key: 'teacher_id'
  #  an user has only a role
  belongs_to :role

  scope :teachers, -> { joins(:role).where('roles.name' => 'teacher')}
  scope :owners, -> { joins(:role).where('roles.name' => 'owner')}
  scope :owner_hqs, -> { joins(:role).where('roles.name' => 'owner hq')}

  def teacher?
    role.name == 'teacher'
  end

  def owner?
    role.name == 'owner'
  end

  def hq_owner?
    role.name == 'owner hq'
  end

  def is_paid?
    is_paid
  end
end
