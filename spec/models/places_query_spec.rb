require 'spec_helper'

describe PlacesQuery do
  let!(:early_special) { FactoryGirl.create :special }
  let(:early_place) { early_special.place }

  let!(:late_special) { FactoryGirl.create :special, start_day: 5, end_day: 5, starts_at: "17:00", ends_at: "02:00" }
  let(:late_place) { late_special.place }

  let(:params) { { open_only: true } }
  subject { PlacesQuery.new(params) }

  before(:each) do
    Timecop.travel time
  end

  after(:each) do
    Timecop.return
  end

  context "when :open_only is set" do
    context "at 2:59pm" do
      let(:time) { Time.zone.local(2014, 3, 14, 14, 59, 0) }
      its(:results) { should be_empty }
    end

    context "at 3:00pm" do
      let(:time) { Time.zone.local(2014, 3, 14, 15, 0, 0) }
      its(:results) { should eq([early_place]) }
    end

    context "at 5:00pm" do
      let(:time) { Time.zone.local(2014, 3, 14, 17, 0, 0) }
      its(:results) { should eq([early_place, late_place]) }
    end

    context "at 6:00pm" do
      let(:time) { Time.zone.local(2014, 3, 14, 18, 0, 0) }
      its(:results) { should eq([late_place]) }
    end

    context "at 9:00pm" do
      let(:time) { Time.zone.local(2014, 3, 14, 21, 0, 0) }
      its(:results) { should eq([late_place]) }
    end

    context "at 12:00am" do
      let(:time) { Time.zone.local(2014, 3, 15, 0, 0, 0) }
      its(:results) { should eq([late_place]) }
    end

    context "at 2:00am" do
      let(:time) { Time.zone.local(2014, 3, 15, 2, 0, 0) }
      its(:results) { should be_empty }
    end

    context "at 3:00am" do
      let(:time) { Time.zone.local(2014, 3, 15, 3, 0, 0) }
      its(:results) { should be_empty }
    end
  end
end
