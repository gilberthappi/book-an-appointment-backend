require 'rails_helper'

describe Place, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:reservations) }
    it { is_expected.to belong_to(:owner).class_name('User') }
  end

  describe 'validations' do
    it 'validates presence of description' do
      Place.destroy_all
      User.destroy_all
      user = User.create!(name: 'John')
      # Updated Place creation to include name attribute
      Place.create!(name: 'Some Place', description: 'John - Photographer', location: 'Peru', owner: user, rate: 200)

      expect(subject).to validate_presence_of(:description)
    end
  end
end
