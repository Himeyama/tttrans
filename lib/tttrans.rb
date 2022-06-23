# frozen_string_literal: true

require "readline"
require "io/console/size"
require "json"
require_relative "tttrans/version"

# TTTrans module
module TTTrans
  class Error < StandardError; end
  # Your code goes here...

  def self.translate(token, text)
    response = token.post(
      ENV["TexTra_URI_EN_JA"], {
        key: ENV["TexTra_API_KEY"],
        type: "json",
        name: ENV["TexTra_ID"],
        text: text
      }
    )
    JSON.parse(response.body)["resultset"]["result"]["text"]
  end
end
