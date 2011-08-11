require "spec_helper"

describe Move do
  it "property :player" do
    Move.property?(:player).should be_true
  end

  it "property :position" do
    Move.property?(:position).should be_true
  end
end

