require 'rails_helper'
require 'factory_bot_rails'

describe User, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:reservations).with_foreign_key(:customer_id) }
    it { is_expected.to have_many(:places).through(:reservations) }
  end
  describe 'validations' do
    Place.destroy_all
    User.destroy_all
    User.create!(name: 'John')

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
  end
end
