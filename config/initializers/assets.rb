# Precompile additional assets (application.js, application.css, and all non-JS/CSS are already added)
# This used to be in production.rb.  New Rails 4.2 functionality?

Rails.application.config.assets.precompile += %w( flipclock.js )

Rails.application.config.assets.precompile += %w( galleries.js )
Rails.application.config.assets.precompile += %w( galleria-1.4.2.js )
Rails.application.config.assets.precompile += %w( galleria.twelve.min.js )
Rails.application.config.assets.precompile += %w( info.js )
Rails.application.config.assets.precompile += %w( polls.js )
Rails.application.config.assets.precompile += %w( jquery.tools.min.js )