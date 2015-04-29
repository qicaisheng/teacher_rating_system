if Rails.env.production?
  CarrierWave.configure do |config|
  #   config.fog_credentials = {
  #     # Configuration for Amazon S3
  #     :provider              => 'AWS',
  #     :aws_access_key_id     => ENV['S3_ACCESS_KEY'],
  #     :aws_secret_access_key => ENV['S3_SECRET_KEY'],
  #     :region                => ENV['S3_REGION']
  #   }
  #   config.fog_directory     =  ENV['S3_BUCKET']

	  config.storage = :upyun
	  config.upyun_username = "teachers"
	  config.upyun_password = 'herokuimage'
	  config.upyun_bucket = "teachers"
	  # upyun_bucket_domain 以后将会弃用，请改用 upyun_bucket_host
	  # config.upyun_bucket_domain = "my_bucket.files.example.com"
	  config.upyun_bucket_host = "http://teachers.b0.upaiyun.com"  
  end

end
