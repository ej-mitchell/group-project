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

end
