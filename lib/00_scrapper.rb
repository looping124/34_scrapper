require 'nokogiri'
require 'pry'
require 'byebug'


def scrapper
  url ="https://coinmarketcap.com/"
  unparsed_page = HTTParty.get(url)
  parsed_page = Nokogiri::HTML(unparsed_page)
  byebug
end


scrapper