config.cache_classes = ENV['PRODUCTION']
config.whiny_nils = true
config.action_controller.consider_all_requests_local = true
config.action_controller.perform_caching = ENV['PRODUCTION']
config.action_view.cache_template_extensions = false
config.action_view.debug_rjs = true
config.action_mailer.raise_delivery_errors = false
