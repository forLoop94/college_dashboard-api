require 'faker'

User.destroy_all
Student.destroy_all
Lecturer.destroy_all
Course.destroy_all

# Seed for Users
10.times do
  User.create(
    email: Faker::Internet.unique.email,
    password: 'password', # You might want to change this
    role: 'user',
    username: Faker::Internet.unique.user_name
  )
end

# Seed for Courses
5.times do
  Course.create(
    title: Faker::Educator.course_name,
    code: Faker::Number.unique.number(digits: 5),
    level: [100, 200, 300, 400, 500].sample,
    department: ['Computer Science', 'Programming'].sample
  )
end

# Seed for Lecturers
10.times do
  lecturer_user = User.all.sample
  Lecturer.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    gender: Faker::Gender.binary_type,
    core_discipline: Faker::Educator.subject,
    number_of_publications: Faker::Number.between(from: 1, to: 100),
    highest_academic_qualification: Faker::Educator.degree,
    photo: Faker::Avatar.image(slug: lecturer_user.username, size: '300x300', format: 'png'),
    rank: Faker::Job.position,
    bio: Faker::Lorem.paragraph,
    department: ['Computer Science', 'Programming'].sample,
    age: Faker::Number.between(from: 25, to: 60),
    phone_number: Faker::PhoneNumber.phone_number,
    lga_of_origin: Faker::Address.city,
    user_id: lecturer_user.id
  )
end

# Seed for Students
20.times do
  student_user = User.all.sample
  Student.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    photo: Faker::Avatar.image(slug: student_user.username, size: '300x300', format: 'png'),
    phone_number: Faker::PhoneNumber.phone_number,
    level: [100, 200, 300, 400, 500].sample,
    gender: Faker::Gender.binary_type,
    department: ['Computer Science', 'Programming'].sample,
    age: Faker::Number.between(from: 18, to: 30),
    bio: Faker::Lorem.paragraph,
    lga_of_origin: Faker::Address.city,
    user_id: student_user.id
  )
end

puts 'Seed data generated successfully!'

