if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      :provider              => 'AWS',
      :aws_access_key_id     => 'AKIAJLOIH3TMQMVXB3XQ',
      :aws_secret_access_key => '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',
      :region 							 => 'us-west-2',
    }
    config.fog_directory     =  'driftmap'
  end
end