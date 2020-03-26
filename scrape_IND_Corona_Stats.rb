#Dhzr

require 'uri'
require 'net/http'
require 'openssl'
require 'csv'
require 'json'
require 'json_converter'
json_converter= JsonConverter.new



v1 = ARGV[0]  
#url = URI("https://covid-19-coronavirus-statistics.p.rapidapi.com/v1/stats?country=#{v1}")
url = URI("https://covid-193.p.rapidapi.com/statistics?country=#{v1}")



unless File.exist?('Data.csv')
  CSV.open("questionsData.csv", "w+") do |csv|
    csv << [
      "Response"
    ]
  end
end

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Get.new(url)
request["x-rapidapi-host"] = 'covid-193.p.rapidapi.com'
request["x-rapidapi-key"] = '19642415e2msh30f555b1aa2a6b9p177dddjsn4770ee825432'
#request["x-rapidapi-host"] = 'covid-19-coronavirus-statistics.p.rapidapi.com'
#request["x-rapidapi-key"] = '19642415e2msh30f555b1aa2a6b9p177dddjsn4770ee825432'

response = http.request(request)
puts response.read_body
#parsed_json = JSON.parse(response.read_body)
#puts confirmed = parsed_json['data']

#corData = json_converter.generate_csv parsed_json
#puts corData
#CSV.open("Data.csv", "a+") do |csv|
	#csv << [
		#corData
	#]
  #end