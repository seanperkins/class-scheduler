# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

teachers = [
  {first_name: 'lin', last_name: 'qiu', subject: 'math'},
  {first_name: 'sean', last_name: 'perkins', subject: 'ela'},
  {first_name: 'chris', last_name: 'garson', subject: 'fun'},
  {first_name: 'aaron', last_name: 'eckhart', subject: 'science'},
  {first_name: 'david', last_name: 'ferris', subject: 'journalism'},
  {first_name: 'john', last_name: 'Doe', subject: 'social studies'},
  {first_name: 'Sarah', last_name: 'Dern', subject: 'math'},
  {first_name: 'Evan', last_name: 'Garson', subject: 'math'},
  {first_name: 'Jane', last_name: 'Doe', subject: 'Nothing'}
]
puts '--Creating teachers out of bits and bytes'
tcount = 0
teachers.each do |t|
  Teacher.create! t
  tcount += 1
end
puts "Created #{tcount} teachers"

puts '--Creating student groups from pieces and parts'
student_groups = [
  {description: 'A', grade: 'K'},
  {description: 'B', grade: 'K'},
  {description: 'C', grade: 'K'},
  {description: 'A', grade: '1'},
  {description: 'B', grade: '1'},
  {description: 'A', grade: '2'},
  {description: 'A', grade: '3'},
  {description: 'A', grade: '4'},
  {description: 'A', grade: '5'},
  {description: 'B', grade: '5'},
]
sgcount = 0
student_groups.each do |sg|
  StudentGroup.create! sg
  sgcount += 1
end
puts "Created #{sgcount} student groups"