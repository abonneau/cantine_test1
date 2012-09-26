# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :recette do
    titre "MyString"
    description "MyString"
    ingredients "MyString"
    preparation "MyString"
    user_id 1
  end
end
