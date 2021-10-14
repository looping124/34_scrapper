require 'nokogiri'
require 'pry'
require 'byebug'
require 'open-uri'
require 'httparty'



def scrapper
  cryptos_array=[]


  url ="https://coinmarketcap.com/all/views/all/"
  page = Nokogiri::HTML(URI.open(url))

page.css(".cmc-table-row").each.with_index do |row, i|
  name= row.css(".cmc-table__cell--sort-by__symbol").text
  price= row.css(".cmc-table__cell--sort-by__price").text.gsub("$", "").gsub(",", "").to_f
  name != "" ? cryptos_array[i] = {name => price} : nil
end

puts cryptos_array
return cryptos_array

end

scrapper


