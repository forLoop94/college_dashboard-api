class StudentSerializer
  include JSONAPI::Serializer
  attributes :id, :first_name, :last_name, :photo, :phone_number, :level, :gender, :department_id, :age, :bio,
             :lga_of_origin
end
