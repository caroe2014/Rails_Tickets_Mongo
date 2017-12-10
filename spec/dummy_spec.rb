require "rails_helper.rb"

describe "testing thatspec is configured" do
  it "shoud pass" do
    expect(true).to eq(true)
  end
  it "can fail" do
    expect(false).to eq(true)
  end
end
