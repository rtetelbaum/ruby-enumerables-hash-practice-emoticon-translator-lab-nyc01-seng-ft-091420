require "yaml"
require "pry"



def get_japanese_emoticon(yaml_file, emoticon)
  load_library(yaml_file).each do |key, value|
    if value[:english] == emoticon
      return value[:japanese]
    end
  end
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(yaml_file, emoticon)
  load_library(yaml_file).each do |key, value|
    if value[:japanese] == emoticon
      return key
    end
  end
  return "Sorry, that emoticon was not found"
end