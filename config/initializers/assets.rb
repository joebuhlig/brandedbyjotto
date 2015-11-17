# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += %w( store/fancybox_sprite.png )
Rails.application.config.assets.precompile += %w( store/fancybox_loading.gif )
Rails.application.config.assets.precompile += %w( store/blank.gif )
Rails.application.config.assets.precompile += %w( store/fancybox_overlay.png )
Rails.application.config.assets.precompile += %w( select2.png )
Rails.application.config.assets.precompile += %w( select2-spinner.gif )
Rails.application.config.assets.precompile += %w( select2x2.png )