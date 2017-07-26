class ProfilePhotoUploader < CarrierWave::Uploader::Base
  storage :file

  include CarrierWave::MiniMagick
  process resize_to_fit: [50, 50]
  version :thumb do
    process resize_to_fill: [50, 50]
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url(*args)
    "http://amreading.s3.amazonaws.com/wp-content/uploads/forgetful-fish-dory_559b363bd577b4951.jpg"
  end

end
