require './key'
require "net/http"
require "uri"
require "openssl"

key = API_KEY
secret = API_SECRET

timestamp = Time.now.to_i.to_s
method = "GET"
uri = URI.parse("https://api.bitflyer.jp")
uri.path = "/v1/me/getbalance"


text = timestamp + method + uri.request_uri
sign = OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new("sha256"), secret, text)

options = Net::HTTP::Get.new(uri.request_uri, initheader = {
  "ACCESS-KEY" => key,
  "ACCESS-TIMESTAMP" => timestamp,
  "ACCESS-SIGN" => sign,
});

https = Net::HTTP.new(uri.host, uri.port)
https.use_ssl = true
response = https.request(options)
puts response.body
