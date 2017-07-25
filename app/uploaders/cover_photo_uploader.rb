class CoverPhotoUploader < CarrierWave::Uploader::Base
  storage :file

  include CarrierWave::MiniMagick
    process resize_to_fit: [200, 200]
    version :thumb do
      process resize_to_fit: [120, 120]
    end

    def store_dir
      "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    end

    def default_url(*args)
      "http://webneel.com/sites/default/files/images/download/thumb/old-book-with-blank-cover%201_0.jpg"
    end
  end
  # storage :fog


  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url(*args)
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end







  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_whitelist
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end
