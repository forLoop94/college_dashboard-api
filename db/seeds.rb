require 'faker'

User.destroy_all
Student.destroy_all
Lecturer.destroy_all
Course.destroy_all

# Seed for Users
User.create(
  email: 'admin@example.com',
  password: 'password',
  role: 'admin',
  username: 'admin'
)

# Seed for Schools
school = School.create(
  name: 'Sample University'
)

# Seed for Departments
computer_science_department = Department.create(
  name: 'Computer Science',
  school_id: school.id
)

programming_department = Department.create(
  name: 'Programming',
  school_id: school.id
)

# Seed for Courses
5.times do
  Course.create(
    title: Faker::Educator.course_name,
    code: Faker::Number.unique.number(digits: 5),
    level: [100, 200, 300, 400, 500].sample,
    department_id: [computer_science_department.id, programming_department.id].sample
  )
end

# Seed for Schools
School.create(
  name: 'Sample University'
)

# Seed for Deans
1.times do
  dean_user = User.create(
    email: Faker::Internet.unique.email,
    password: 'password', # Change this to a secure password
    role: 'dean',
    username: Faker::Internet.unique.user_name
  )

  Dean.create(
    user_id: dean_user.id,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    gender: Faker::Gender.binary_type,
    years_of_admin_exp: Faker::Number.between(from: 1, to: 20),
    number_of_publications: Faker::Number.between(from: 1, to: 100),
    highest_academic_qualification: Faker::Educator.degree,
    photo: Faker::Avatar.image(slug: dean_user.username, size: '300x300', format: 'png'),
    rank: Faker::Job.position,
    bio: Faker::Lorem.paragraph,
    school_id: school.id,
    age: Faker::Number.between(from: 35, to: 70),
    phone_number: Faker::PhoneNumber.phone_number,
    lga_of_origin: Faker::Address.city
  )
end

# Seed for HODs
1.times do
  hod_user = User.create(
    email: Faker::Internet.unique.email,
    password: 'password', # Change this to a secure password
    role: 'hod',
    username: Faker::Internet.unique.user_name
  )

  Hod.create(
    user_id: hod_user.id,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    gender: Faker::Gender.binary_type,
    years_of_admin_exp: Faker::Number.between(from: 1, to: 20),
    number_of_publications: Faker::Number.between(from: 1, to: 100),
    highest_academic_qualification: Faker::Educator.degree,
    photo: Faker::Avatar.image(slug: hod_user.username, size: '300x300', format: 'png'),
    rank: Faker::Job.position,
    bio: Faker::Lorem.paragraph,
    department_id: [computer_science_department.id, programming_department.id].sample,
    age: Faker::Number.between(from: 30, to: 65),
    phone_number: Faker::PhoneNumber.phone_number,
    lga_of_origin: Faker::Address.city
  )
end

# Seed for Lecturers
2.times do
  lecturer_user = User.create(
    email: Faker::Internet.unique.email,
    password: 'password', # Change this to a secure password
    role: 'lecturer',
    username: Faker::Internet.unique.user_name
  )

  Lecturer.create(
    user_id: lecturer_user.id,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    gender: Faker::Gender.binary_type,
    core_discipline: Faker::Educator.subject,
    number_of_publications: Faker::Number.between(from: 1, to: 100),
    highest_academic_qualification: Faker::Educator.degree,
    photo: Faker::Avatar.image(slug: lecturer_user.username, size: '300x300', format: 'png'),
    rank: Faker::Job.position,
    bio: Faker::Lorem.paragraph,
    department_id: [computer_science_department.id, programming_department.id].sample,
    age: Faker::Number.between(from: 25, to: 60),
    phone_number: Faker::PhoneNumber.phone_number,
    lga_of_origin: Faker::Address.city
  )
end

# Seed for Students
3.times do
  student_user = User.create(
    email: Faker::Internet.unique.email,
    password: 'password',
    role: 'student',
    username: Faker::Internet.unique.user_name
  )

  Student.create(
    user_id: student_user.id,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    photo: Faker::Avatar.image(slug: student_user.username, size: '300x300', format: 'png'),
    phone_number: Faker::PhoneNumber.phone_number,
    level: [100, 200, 300, 400, 500].sample,
    gender: Faker::Gender.binary_type,
    department_id: [computer_science_department.id, programming_department.id].sample,
    age: Faker::Number.between(from: 18, to: 30),
    bio: Faker::Lorem.paragraph,
    lga_of_origin: Faker::Address.city
  )
end

puts 'Seed data generated successfully!'
