# frozen_string_literal: true

require "readline"
require "io/console/size"
require "json"
require "oauth"
require_relative "tttrans/version"

# TTTrans module
module TTTrans
  class Error < StandardError; end
  # Your code goes here...

  def self.token(api_key, api_secret)
    consumer = OAuth::Consumer.new(api_key, api_secret)
    OAuth::AccessToken.new(consumer)
  end

  def self.translate(
    token,
    api_key,
    user_id,
    text,
    mode = :en2ja
  )
    case mode
    when :en2ja
      url = "https://mt-auto-minhon-mlt.ucri.jgn-x.jp/api/mt/generalNT_en_ja/"
    when :ja2en
      url = "https://mt-auto-minhon-mlt.ucri.jgn-x.jp/api/mt/generalNT_ja_en/"
    end

    response = token.post(
      url, {
        key: api_key,
        type: "json",
        name: user_id,
        text: text
      }
    )
    JSON.parse(response.body)["resultset"]["result"]["text"]
  end
end
