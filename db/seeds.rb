
require 'faker'


p 'destroy all tables'
Role.destroy_all
User.destroy_all
School.destroy_all
SchoolClass.destroy_all
Tracking.destroy_all
Feature.destroy_all
FeatureControl.destroy_all

p 'create roles for user'
['owner hq', 'owner', 'teacher'].each do |role|
  Role.create( { name: role } )
end

p 'create users'
(1..100).each {
  User.create( { name: Faker::Name.name, role_id: Role.pluck(:id).sample, is_paid: [true, false].sample } )
}

p 'create schools & classes tables'
(1..50).each do |id|
  # TODO Clean code
  parent_id = nil
  parent_id = 1 if id.between?(2,9)
  parent_id = 10 if id.between?(11,19)
  parent_id = 20 if id.between?(21,29)
  parent_id = 30 if id.between?(31,39)
  parent_id = 40 if id.between?(41,50)

  school = {
      id: id,
      name: "School #{Faker::Name.name}",
      parent_id: parent_id,
      payment_type: ["free", "paid"].sample,
      owner_id: User.owners.pluck(:id).sample,
      hq_owner_id: User.owner_hqs.pluck(:id).sample
  }
  school = School.create(school)

  # create 5 classes for each school
  (1..5).each do
    school_class = {
        name: "class #{Faker::Name.name}",
        year: rand(1990..2018),
        teacher_id: User.teachers.pluck(:id).sample,
        school_id: school.id
    }
    SchoolClass.create(school_class)
  end

end

p 'create tracking table that is tracked checkin/out  '
SchoolClass.pluck(:id).each do |class_id|
  (1..10).each do |number|
    tracking = {
        child_name: Faker::Name.name,
        class_id: class_id,
        time_check_in: Time.zone.now,
        time_check_out: Time.zone.now + rand(1..4).hours
    }
    Tracking.create(tracking)
  end
end

p 'add feature export csv to table'
Feature.create( {name: 'export_csv_tracking_data'})

p 'enable the feature to all users'
feature_control = {
    feature_name: 'export_csv_tracking_data',
    type_control: "All_User",
    value: 'true'
}

FeatureControl.create(feature_control)

p 'the process of seeding data is done'








