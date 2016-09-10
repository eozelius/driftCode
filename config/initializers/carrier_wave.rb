=begin
if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      :provider              => 'AWS',
      :aws_access_key_id     => ENV['S3_ACCESS_KEY'],
      :aws_secret_access_key => ENV['S3_SECRET_KEY']
    }
    config.fog_directory     =  ENV['S3_BUCKET']
  end
end
=end

if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      :provider              => 'AWS',
      :aws_access_key_id     => 'AKIAJLOIH3TMQMVXB3XQ',
      :aws_secret_access_key => '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'
    }
    config.fog_directory     =  'driftmap'
  end
end