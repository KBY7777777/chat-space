#応用No124にて、upload先の設定のため作成

require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  config.storage = :fog
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV["AWS_ACCESS_KEY_ID"],    #ここは設定した環境変数を呼び出している
    aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],    #ここも設定した環境変数を呼び出している
    region: 'ap-northeast-1'
  }

  config.fog_directory  = 'chatspace2020-80'
  config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/chatspace2020-80'
  #上記パスについて、「regionで設定してある「ap-northeast-1」は、アジアパシフィック（東京）を表している」とのこと
end
