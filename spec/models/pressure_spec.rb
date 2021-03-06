# frozen_string_literal: true

require 'rails_helper'
require 'date'

RSpec.describe Pressure, type: :model do
  describe 'Associations' do
    it { should belong_to :profile }
  end

  describe 'Validations' do
    before do
      @existing_profile = FactoryBot.create :profile, email: 'joao@example.org'
    end

    it "Is valid with valid attributes" do
      pressure = Pressure.new(systolic: 1, diastolic: 60, date: DateTime.now, profile: @existing_profile)
      expect(pressure).to be_valid
    end

    it "Should have a profile associated" do
      pressure = Pressure.new(systolic: 1, diastolic: 60, date: DateTime.now, profile: nil)
      expect(pressure).to_not be_valid
    end

    it "Is not valid without a value" do
      pressure = Pressure.new(systolic: nil, diastolic: 60, date: DateTime.now, profile: @existing_profile)
      expect(pressure).to_not be_valid
    end

    it "Value should not lesser than 0" do
      pressure = Pressure.new(systolic: -1, diastolic: 60, date: DateTime.now, profile: @existing_profile)
      expect(pressure).to_not be_valid
    end
  end
end
