# read guild members from Discord,
# output a tab-separated file with number of joins per week and running total of members.

require "time"
require "./config"
require "./discord_api"

ZXB_GUILD_ID    = "412477591778492427"
DAYS_PER_BIN    = 7 # set to 7 for weekly stats
SECONDS_PER_BIN = DAYS_PER_BIN * 86400
START_BIN       = Time.parse("2018-02-12 00:00:00 +0000").to_i # day of 0xBitcoin Discord creation
FILENAME        = "members.tsv"

load_config!
discord = DiscordApi.new(@config["token"])

puts "loading users..."
users = []
after = 0
loop do
  j = discord.get_users(ZXB_GUILD_ID, after: after)
  puts "  got #{j.length} users"
  break if j.empty?
  users += j
  after = j.last[:user][:id]
end
puts "got #{users.count} total users"

bins = Hash.new { |h, k| h[k] = [] }
users.each do |u|
  joined_at = Time.parse(u[:joined_at])
  bin = (joined_at.to_i - START_BIN) / SECONDS_PER_BIN * SECONDS_PER_BIN + START_BIN
  bins[bin] << u
end
bins =
  bins.sort.
  tap { |bins| bins.pop } # ignore last week of results since it's not over yet

total = 0
File.open(FILENAME, "w") do |o|
  bins.each do |bin, users|
    total += users.count
    o.puts [Time.at(bin).strftime("%Y-%m-%d"), users.count, total].join("\t")
  end
end
puts "wrote stats to #{FILENAME}"
