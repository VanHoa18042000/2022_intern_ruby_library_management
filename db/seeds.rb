User.create!(name: "caoson",
  email: "caovanson@sun-asterisk.com",
  password: "123123",
  password_confirmation: "123123",
  phone_number: "0338910238",
  admin: true)

9.times do |n|
password = "123123"
User.create!(
  name: Faker::Name.name,
  email: Faker::Internet.email,
  password: password,
  password_confirmation: password,
  description: Faker::Lorem.sentence(word_count: 20),
  phone_number: Faker::PhoneNumber.phone_number,
)
end

99.times do |n|
  CategoryBook.create!(name: "sach - #{n+1}")
  name = "sach - #{n+1}"
  CategoryBook.create!(name: name)

40.times do |n|
  name = "Nguyen Van A#{n+1}"
  description = "Vui tinh, Hoa dong, yeu thien nhien"
  dob = Date.new(2000, 04, 18)
  gender = 1
  Author.create!(name: name,
    description: description,
    dob: dob,
    gender: gender,
  )

end
