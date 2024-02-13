FactoryBot.define do
  factory :place do
    # Define attributes here
    owner_id { 2 }
    description { "Test Description" }
    location { "Test Location" }
    rate { 10 }
    # Add other attributes as needed
  end
end
