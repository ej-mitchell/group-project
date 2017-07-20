class ProfilePhotoUploader < CarrierWave::Uploader::Base
  storage :file

  include CarrierWave::MiniMagick
  process resize_to_fit: [200, 200]
  version :thumb do
    process resize_to_fill: [120, 120]
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url(*args)
    "http://amreading.s3.amazonaws.com/wp-content/uploads/forgetful-fish-dory_559b363bd577b4951.jpg"
  end

end
