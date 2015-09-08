# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
30.times do |i|
  Question.create(head: "Title of the #{i} question", body: 'Quisque faucibus placerat justo, at tincidunt ipsum egestas vitae. Praesent id augue vel nisl auctor rhoncus a ut est. Pellentesque tincidunt massa eget libero aliquam, sit amet ultricies urna tristique. Sed lacinia enim sed lorem lobortis, pretium commodo odio finibus', author_id: i%5+1)
end