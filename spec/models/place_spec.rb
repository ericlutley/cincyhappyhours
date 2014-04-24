require 'spec_helper'

describe Place do
  subject { Place.create name: 'Via Vite', address: "520 Vine St Cincinnati, OH" }

  its(:longitude) { should == -84.5130269 }
  its(:latitude) { should == 39.101898 }
end