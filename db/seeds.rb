# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

teachers = [
  {first_name: 'lin', last_name: 'qiu', subject: 'FLES'},
  {first_name: 'sean', last_name: 'perkins', subject: 'Art'},
  {first_name: 'chris', last_name: 'garson', subject: 'Art'},
  {first_name: 'aaron', last_name: 'eckhart', subject: 'PE'},
  {first_name: 'david', last_name: 'ferris', subject: 'PE'},
  {first_name: 'john', last_name: 'Doe', subject: 'Music'},
  {first_name: 'Sarah', last_name: 'Dern', subject: 'Music'},
  {first_name: 'Evan', last_name: 'Garson', subject: 'FLES'}
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
  {description: 'pre K angels', grade: 'preK'},
  {description: 'pre K hellions', grade: 'preK'},
  {description: 'Kindergarden Cops', grade: 'K'},
  {description: 'Who is your Daddy and what does he do?', grade: 'K'},
  {description: 'Grade One-derfuls', grade: '1'},
  {description: 'Grade One and Only', grade: '1'},
  {description: 'Grade tworrific', grade: '2'},
  {description: 'Grade twos clues', grade: '2'},
  {description: 'Grade Threetings', grade: '3'},
  {description: 'Service Threes', grade: '3'},
]
sgcount = 0
student_groups.each do |sg|
  StudentGroup.create! sg
  sgcount += 1
end
puts "Created #{sgcount} student groups"