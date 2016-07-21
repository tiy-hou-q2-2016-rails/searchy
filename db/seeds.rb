
100.times do
  Page.create! uri: Faker::Internet.url, content: Faker::Hipster.paragraphs(1, true).join("\n"), title: Faker::Book.title 

end
