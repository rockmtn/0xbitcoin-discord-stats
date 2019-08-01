# read guild members from Discord,
# output a tab-separated file with number of joins per week and running total of members.

require "httparty"
require "json"
require "time"
require "yaml"

DAYS_PER_BIN = 7 # set to 7 for weekly stats
SECONDS_PER_BIN = DAYS_PER_BIN * 86400
ZxBITCOIN_GUILD_ID = "412477591778492427"
URL = "https://discordapp.com/api/v6/guilds/#{ZxBITCOIN_GUILD_ID}/members"
FILENAME = "discord.tsv"

config = YAML::load_file("config.yml")
@token = config["token"]

def get_users(after)
  url = URL + "?limit=1000&after=#{after}"
  puts url
  headers = {"accept":"*/*", "accept-language":"en-US", "authorization": @token}
  r = HTTParty.get(url, headers: headers, format: :plain)
  JSON.parse(r, symbolize_names: true)
end

puts "loading users..."
users = []
after = 0
loop do
  j = get_users(after)
  puts "  got #{j.length} users"
  break if j.empty?
  users += j
  after = j.last[:user][:id]
end
puts "got #{users.count} total users"

bins = Hash.new { |h, k| h[k] = [] }
users.each do |u|
  joined_at = Time.parse(u[:joined_at])
  bin = joined_at.to_i / SECONDS_PER_BIN * SECONDS_PER_BIN
  bins[bin] << u
end
bins = bins.sort_by { |k, v| k }.
  tap { |bins| bins.pop }.  # ignore last week of results since it's not over yet
  to_h

total = 0
File.open(FILENAME, "w") do |o|
  bins.each do |bin, users|
    total += users.count
    o.puts [Time.at(bin).strftime("%Y-%m-%d"), users.count, total].join("\t")
  end
end
puts "wrote stats to #{FILENAME}"
