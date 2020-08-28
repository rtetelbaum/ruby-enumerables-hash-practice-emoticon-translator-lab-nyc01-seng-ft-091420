require "yaml"
require "pry"

def load_library(yaml_file)
  emo_orig = YAML.load_file(yaml_file)
  emo_conv = {}
  emo_orig.each do |key,value|
    emo_conv[key] = {}
    emo_conv[key][:english] = value[0]
    emo_conv[key][:japanese] = value[1]
  end
  emo_conv
end

def get_japanese_emoticon(yaml_file, emoticon)
  emo_conv = load_library(yaml_file)
  jap_emo = emo_conv.keys.find { |key| emo_conv[key][:english] == emoticon }
  jap_emo ? emo_conv[jap_emo][:japanese] : "Sorry, that emoticon was not found"
end

def get_english_meaning(yaml_file, emoticon)
  emo_conv = load_library(yaml_file)
  english_meaning = emo_conv.keys.find { |key| emo_conv[key][:japanese] == emoticon }
  english_meaning ? english_meaning : "Sorry, that emoticon was not found"
end

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