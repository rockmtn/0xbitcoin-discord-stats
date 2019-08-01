require "./config"
require "./discord_api"
require "time"

ZXB_GUILD_ID = "412477591778492427"
STEP         = 86400*7
START_TS     = Time.parse("2018-02-12 00:00:00 +0000").to_i # day of 0xBitcoin Discord creation
END_TS       = (Time.now.to_i - START_TS) / STEP * STEP + START_TS - 1
FILENAME     = "messages.tsv"

load_config!
discord = DiscordApi.new(@config["token"])

def fmt(t); t.strftime("%Y-%m-%d %H:%M:%S"); end
def ymd(t); t.strftime("%Y-%m-%d"); end

File.open(FILENAME, "w") do |o|
  range = (START_TS..END_TS).step(STEP)
  puts "searching #{range.to_a.length} ranges"

  range.each do |timestamp|
    timestamp_end = timestamp + STEP
    time          = Time.at(timestamp).utc
    time_end      = Time.at(timestamp_end).utc

    min_id = DiscordApi.timestamp_to_snowflake(timestamp)
    max_id = DiscordApi.timestamp_to_snowflake(timestamp_end)
    puts "searching #{fmt(time)} thru #{fmt(time_end-1)}"
    puts "  min_id: #{min_id} thru max_id: #{max_id}"

    r = discord.search(
      ZXB_GUILD_ID,
      min_id: min_id,
      max_id: max_id,
      limit: 1
    )

    puts "  #{r[:total_results]} messages"
    o.puts [ymd(time), r[:total_results]] * "\t"
  end
end
puts "wrote stats to #{FILENAME}"
