require 'spec_helper'

describe Place do
  describe 'when location coordinates are not specified' do
    subject { Place.new name: 'Via Vite', address: "520 Vine St Cincinnati, OH" }

    it 'automatically geocodes the address' do
      expect(subject).to receive(:geocode).once
      subject.save!
    end
  end

  describe 'when both location coordinates are provided' do
    subject { Place.new(name: 'Via Vite', address: "1234 Main St", latitude: 40.0, longitude: -85.0) }

    it 'does not try to geocode the address' do
      expect(subject).to_not receive(:geocode)
      subject.save!
    end
  end

  # DB indexes
  it { should have_db_index(:external_id).unique(true) }
  it { should have_db_index(:facebook_id).unique(true) }
end
