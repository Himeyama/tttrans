# frozen_string_literal: true

require "readline"
require "io/console/size"
require "json"
require "oauth2"
require_relative "tttrans/version"
require "net/http"
require "uri"

# TTTrans module
module TTTrans
  class Error < StandardError; end

  def self.token(client_key, client_secret)
    token_url = "https://mt-auto-minhon-mlt.ucri.jgn-x.jp/oauth2/token.php"
    client = OAuth2::Client.new(client_key, client_secret, site: token_url)
    client.client_credentials.get_token
  end

  # rubocop:disable Metrics/AbcSize
  def self.translate(
    token,
    api_key,
    user_id,
    text,
    mode = :en2ja
  )
    url = "https://mt-auto-minhon-mlt.ucri.jgn-x.jp/api/?"
    case mode
    when :en2ja
      api_param = "generalNT_en_ja"
    when :ja2en
      api_param = "generalNT_ja_en"
    end

    body = {
      "access_token" => token.token,
      "key" => api_key,
      "name" => user_id,
      "type" => "json",
      "text" => text,
      "api_param" => api_param,
      "api_name" => "mt"
    }

    response = Net::HTTP.post_form(URI.parse(url), body)

    result = JSON.parse(response.body)
    txt = ""
    resultset = result["resultset"]
    if resultset
      code = resultset["code"]
      if [501, 510].include?(code)
        return "\e[31;1mERROR (#{code})#{resultset["message"] == "" ? "" : ": #{resultset["message"]}"}\e[0m"
      end

      begin
        txt = resultset["result"]["text"]
      rescue StandardError
        txt = "\e[31;1mERROR (#{code})\e[0m"
      end
    end
    txt
  end
  # rubocop:enable Metrics/AbcSize
end
