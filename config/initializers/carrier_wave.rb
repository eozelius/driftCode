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
      :region 							 => 'us-west-2'
    }
    config.fog_directory     =  'driftmap'
  end
end

=begin
	Excon::Error::BadRequest: Expected(200) <=> Actual(400 Bad Request)
	excon.error.response
	  :body          => "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<Error><Code>AuthorizationHeaderMalformed</Code><Message>The authorization header is malformed; the region 'us-east-1' is wrong; expecting 'us-west-2'</Message><Region>us-west-2</Region><RequestId>A6BE47CD58CA810C</RequestId><HostId>vuLce8gn75D50cChdz7D45THFtPqZ24N6Bz2HJz+1vnrsKdlEah34XHf3RBFLNdV0Pyg28vxJWI=</HostId></Error>"
	  :cookies       => [
	  ]
	  :headers       => {
	    "Connection"       => "close"
	    "Content-Type"     => "application/xml"
	    "Date"             => "Sat, 10 Sep 2016 00:27:16 GMT"
	    "Server"           => "AmazonS3"
	    "x-amz-id-2"       => "vuLce8gn75D50cChdz7D45THFtPqZ24N6Bz2HJz+1vnrsKdlEah34XHf3RBFLNdV0Pyg28vxJWI="
	    "x-amz-request-id" => "A6BE47CD58CA810C"
	  }
	  :host          => "driftmap.s3.amazonaws.com"
	  :local_address => "172.31.19.221"
	  :local_port    => 42669
	  :path          => "/uploads/user/profile_pic/1/ethan.jpg"
	  :port          => 443
	  :reason_phrase => "Bad Request"
	  :remote_ip     => "54.231.169.14"
	  :status        => 400
	  :status_line   => "HTTP/1.1 400 Bad Request\r\n"
	/home/ubuntu/driftCode/db/seeds.rb:2:in `<top (required)>'
	

=end