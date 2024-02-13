# factories/reservations.rb

FactoryBot.define do
  factory :reservation do
    # Define attributes here
    start_date { Date.today }
    end_date { Date.today + 1 }
    bill { 100 }
    
    # Create an associated user record
    association :customer, factory: :user
    
    # Create an associated place record
  end
end
