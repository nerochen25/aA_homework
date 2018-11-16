FactoryBot.define do
  factory :userbundle do
    exec { "MyString" }
    rspec { "MyString" }
    spec/models/user_spec.rb { "MyString" }
  end
end
