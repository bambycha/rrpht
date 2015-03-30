CarrierWave.configure do |config|
  config.fog_credentials = {
    provider:              'AWS',
    aws_access_key_id:     'AKIAJWQHRLOZC7D7PHSA',#ENV['aws_access_key'],
    aws_secret_access_key: '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',#ENV['aws_secret_key'],
    region:                'eu-west-1'
  }
  config.fog_directory  = 'rrpht'
  config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" }
end