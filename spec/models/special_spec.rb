require 'spec_helper'

describe Special do
  subject { FactoryGirl.create :special }

  after(:each) do
    Timecop.return
  end

  describe "#available_now?" do
    it "returns false 24 hours before the special is available" do
      Timecop.travel Time.zone.local(2014, 3, 9, 16, 30, 0)
      subject.available_now?.should be_false
    end

    it "returns false when the special is later in the day" do
      Timecop.travel Time.zone.local(2014, 3, 14, 14, 55, 0)
      subject.available_now?.should be_false
    end

    it "returns true when the special has just started" do
      Timecop.travel Time.zone.local(2014, 3, 14, 15, 0, 0)
      subject.available_now?.should be_true
    end

    it "returns true when the special is underway" do
      Timecop.travel Time.zone.local(2014, 3, 14, 16, 30, 0)
      subject.available_now?.should be_true
    end

    it "returns false when the special has just ended" do
      Timecop.travel Time.zone.local(2014, 3, 14, 18, 0, 0)
      subject.available_now?.should be_false
    end

    it "returns false when the special is earlier in the day" do
      Timecop.travel Time.zone.local(2014, 3, 14, 18, 0, 0)
      subject.available_now?.should be_false
    end

    it "returns false 24 hours after the special is available" do
      Timecop.travel Time.zone.local(2014, 3, 15, 16, 30, 0)
      subject.available_now?.should be_false
    end

    context "when the special lasts past midnight" do
      subject { FactoryGirl.create :special, start_day: 4, end_day: 4, starts_at: "21:00", ends_at: "02:00" }

      it "returns false 24 hours before the special is available" do
        Timecop.travel Time.zone.local(2014, 3, 12, 22, 50, 0)
        subject.available_now?.should be_false
      end

      it "returns false before the special" do
        Timecop.travel Time.zone.local(2014, 3, 13, 20, 59, 0)
        subject.available_now?.should be_false
      end

      it "returns true when the time is before midnight" do
        Timecop.travel Time.zone.local(2014, 3, 13, 22, 50, 0)
        subject.available_now?.should be_true
      end

      it "returns true when the time is after midnight" do
        Timecop.travel Time.zone.local(2014, 3, 14, 0, 30, 0)
        subject.available_now?.should be_true
      end

      it "returns false after the special ends" do
        Timecop.travel Time.zone.local(2014, 3, 14, 2, 0, 0)
        subject.available_now?.should be_false
      end

      it "returns false 24 hours after the special is available" do
        Timecop.travel Time.zone.local(2014, 3, 14, 22, 50, 0)
        subject.available_now?.should be_false
      end
    end
  end
end
