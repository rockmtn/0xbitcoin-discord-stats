require "yaml"

def load_config!
  @config = YAML::load_file("config.yml")
end
