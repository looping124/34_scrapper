require_relative '../lib/01_cities.rb'

describe "the fonction perform" do
  it "should return an Array" do
     expect(perform.class).to eq(Array)
  end
  it "should not be empty" do
    expect(perform.size).not_to eq([])
 end
end