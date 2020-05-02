CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS', # required
    aws_access_key_id: ENV['S3_ACCESS_KEY'], # required
    aws_secret_access_key: ENV['S3_SECRET_KEY'], # required
    region: ENV['S3_REGION'] # required
  }
  config.fog_directory = ENV['S3_BUCKET'] # required
  config.fog_public = 'false'
  config.fog_attributes = {'Cache-Control' => "max-age=#{365.to_i}" }
end
