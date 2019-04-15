
require 'rest-client'

class BingSearch
  def initialize(url, query)
    @data = RestClient.get(url, {params: {q: query}})
  end

  def print_data
    puts "\nServer response:\n#{@data.code}"
    puts "\nHeaders:\n#{@data.headers}"
    puts "\nCookies:\n#{@data.cookies}"
    # puts "\nBody:\n#{@data.body}"
  end

  def print_links
    raw = @data.body.split('b_algo"><h2><a href="').drop(1)
    links = []
    raw.each do |e|
      temp = e.split('" ')
      links << temp[0]
    end
    links.each {|l| puts l}
  end
end

url = 'https://www.bing.com/'
query = 'vscode'
search = BingSearch.new(url, query)

search.print_links
# search.print_data
