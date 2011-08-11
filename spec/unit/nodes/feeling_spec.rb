require "spec_helper"

describe Feeling do
  it "has_n :moves" do
    Feeling.should have_n(:board_statuses, :to => :board_status)
  end

  it "property :name" do
    Feeling.property?(:name).should be_true
  end

  it "index :name" do
    Feeling.index?(:name).should be_true
  end
end

