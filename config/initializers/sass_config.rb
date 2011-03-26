# Theme stylesheet template routes
Sass::Plugin.add_template_location(
  Rails.root.join('themes/test_theme/stylesheets/sass').to_s,
  Rails.root.join('themes/test_theme/stylesheets').to_s
)

