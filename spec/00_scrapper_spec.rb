require_relative '../lib/00_crypto_scrapper.rb'

describe "the fonction perform" do
  it "should return an Array" do
     expect(scrapper.class).to eq(Array)
  end
  it "should not be empty" do
    expect(scrapper.size).not_to eq([])
 end
end