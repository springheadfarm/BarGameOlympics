
# only setup fog in production
#if Rails.env.production? then

if true then
  CarrierWave.configure do |config|
    config.fog_credentials = {
      :provider               => 'AWS',                        # required
      :aws_access_key_id      => 'AKIAIKI3XUMPVV3XNBQA',                        # required
      :aws_secret_access_key  => '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'
    }
    config.fog_directory  = 'BarGameOlympics'                     # required
    config.fog_public     = false                                   # optional, defaults to true
  end

end