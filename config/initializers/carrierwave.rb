CarrierWave.configure do |config|
  config.sftp_host = "files.kflink.com"
  config.sftp_user = "ticketrails"
  config.sftp_folder = "files.kflink.com"
  config.sftp_url = "http://files.kflink.com"
  config.sftp_options = {
    :password => "jarenauer",
    :port     => 22
  }
end
