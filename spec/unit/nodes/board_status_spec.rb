require "spec_helper"

describe BoardStatus do
  it "has_n :moved_from" do
    BoardStatus.should have_n(:moved_from, :from => [:board_status], :relationship => Move)
  end

  it "has_n :moved_to" do
    BoardStatus.should have_n(:moved_to, :to => :board_status, :relationship => Move)
  end

  it "has_one :feeling" do
    BoardStatus.should have_one(:feeling, :from => [:feeling])
  end

  it "property :status_hash" do
    BoardStatus.property?(:status_hash).should be_true
  end
end

