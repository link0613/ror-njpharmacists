namespace :pg do
  desc "PG Backup"
  task :backup => [:environment] do
    with_config = Rails.application.config.database_configuration
    config = with_config[Rails.env]    
    exec "PGPASSWORD=#{config['password']} pg_dump --host #{config['host']} --username #{config['username']} --verbose --clean --no-owner --no-acl --format=c #{config['database']} > #{Rails.root}/tmp/#{Date.today}.dump"
  end

  task :upload_backup => [:environment] do
    require 'aws-sdk'
    temp_file = File.open("#{Rails.root}/tmp/#{Date.today}.dump")
    s3 = Aws::S3::Resource.new(region: ENV["AWS_REGION"])
    obj = s3.bucket(ENV['AWS_BUCKET']).object(File.basename(temp_file))
    obj.upload_file(temp_file)
    temp_file.close
    File.delete(temp_file)
  end

  task :application_backup => [:environment] do
    require 'zip_file_generator'
    z = ZipFileGenerator.new(Rails.root.to_s,Rails.root.join("tmp/app.zip"))
    z.write
  end

  task :application_upload => [:environment] do
    require 'aws-sdk'
    temp_file = File.open("#{Rails.root}/tmp/app.zip")
    puts "@@@@@@@@@@@@@@@@@@@@@@@@"
    s3 = Aws::S3::Resource.new(region:ENV["AWS_REGION"])
    obj = s3.bucket(ENV['AWS_BUCKET']).object(File.basename(temp_file))
    puts "******************************"
    obj.upload_file(temp_file)
    puts "@&@&@&@&@&@&@&@&@&&&&&&&&&&&&&&&"
    temp_file.close
    File.delete(temp_file)
  end
end
