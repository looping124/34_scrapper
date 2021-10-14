require 'nokogiri'
require 'pry'
require 'byebug'
require 'open-uri'
require 'httparty'



def get_townhall_email (link_city)
  page_ville = Nokogiri::HTML(URI.open(link_city)) 
  email = page_ville.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
  return email

end

def get_townhall_urls(link_departement) 

  page = Nokogiri::HTML(URI.open(link_departement))
  links = page.css(".lientxt")
  links_cities=  links.map {|element| element["href"]}.compact
  links_final_array =[]
  links_cities.each.with_index do |link, index|
    links_final_array[index] = {link.gsub("./95/", "").gsub(".html", "").capitalize =>"https://www.annuaire-des-mairies.com/"+link.gsub("./", "")}
  end
  return links_final_array
end



def perform
  link_departement = "https://www.annuaire-des-mairies.com/val-d-oise.html"
  cities_links_array = get_townhall_urls(link_departement)

   cities_links_array.each do |cities_links_hash|
   
      cities_links_hash.each { |k, v| cities_links_hash[k] = get_townhall_email(cities_links_hash[k]) } 
  
   end

   puts cities_links_array
   return cities_links_array
   

 
end

perform
# get_townhall_urls
# get_townhall_email