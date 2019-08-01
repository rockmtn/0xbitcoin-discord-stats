# custom Discord API for just the stuff we need

require "httparty"
require "json"

class DiscordApi
  include HTTParty
  base_uri "discordapp.com"

  def initialize(token)
    @token = token
  end

  def get_users(guild_id, after: 0, limit: 1000)
    get("/guilds/#{guild_id}/members", after: after, limit: limit)
  end

  def search(guild_id, params)
    get("/guilds/#{guild_id}/messages/search", params)
  end

  def self.snowflake_to_timestamp(snowflake)
    ((snowflake >> 22) + 1420070400000) / 1000
  end

  def self.timestamp_to_snowflake(timestamp)
    (timestamp * 1000 - 1420070400000) << 22
  end

  private
  def get(path, query)
    headers = {"accept":"*/*", "accept-language":"en-US", "authorization": @token}
    options = {headers: headers, format: :plain, query: query}
    r = self.class.get("/api/v6/#{path}", options)
    JSON.parse(r, symbolize_names: true)
  end
end
