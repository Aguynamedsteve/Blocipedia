FactoryGirl.define do
  factory :wiki do
    title "Wikititle"
    body "randomstufadlfkjalfkjasdlfkjadlfkajflakjlk"
    private false
    user_id 1
  end
  
  factory :user do
    name "testuser"
    email "testuser@example.com"
    role "member"
    password "helloworld"
    password_confirmation "helloworld"
  end
end