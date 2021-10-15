require 'nokogiri'
require 'pry'
require 'byebug'
require 'open-uri'
require 'httparty'



def scrapper
  cryptos_array=[]


  url ="https://coinmarketcap.com/all/views/all/"
  page = Nokogiri::HTML(URI.open(url))

page.css(".cmc-table-row").each.with_index do |row, i| #on prcourt chaque ligne de la page
  name= row.css(".cmc-table__cell--sort-by__symbol").text
  price= row.css(".cmc-table__cell--sort-by__price").text.gsub("$", "").gsub(",", "").to_f
  name != "" ? cryptos_array[i] = {name => price} : nil #on évite de remplir le tableau avec des valeurs nulles

end

puts cryptos_array
return cryptos_array

end

scrapper


