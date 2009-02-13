# Be sure to restart your server when you modify this file

# Uncomment below to force Rails into production mode when
# you don't control web/app server and can't set it the proper way
# ENV['RAILS_ENV'] ||= 'production'

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.1.0' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  # Settings in config/environments/* take precedence over those specified here.
  # Application configuration should go into files in config/initializers
  # -- all .rb files in that directory are automatically loaded.
  # See Rails::Configuration for more options.

  # Skip frameworks you're not going to use. To use Rails without a database
  # you must remove the Active Record framework.
  # config.frameworks -= [ :active_record, :active_resource, :action_mailer ]

  # Specify gems that this application depends on. 
  # They can then be installed with "rake gems:install" on new installations.
  # You have to specify the :lib option for libraries, where the Gem name (sqlite3-ruby) differs from the file itself (sqlite3)
  # config.gem "bj"
  # config.gem "hpricot", :version => '0.6', :source => "http://code.whytheluckystiff.net"
  # config.gem "sqlite3-ruby", :lib => "sqlite3"
  # config.gem "aws-s3", :lib => "aws/s3"

  # Only load the plugins named here, in the order given. By default, all plugins 
  # in vendor/plugins are loaded in alphabetical order.
  # :all can be used as a placeholder for all plugins not explicitly named
  # config.plugins = [ :exception_notification, :ssl_requirement, :all ]

  # Add additional load paths for your own custom dirs
  # config.load_paths += %W( #{RAILS_ROOT}/extras )

  # Force all environments to use the same logger level
  # (by default production uses :info, the others :debug)
  # config.log_level = :debug

  # Make Time.zone default to the specified zone, and make Active Record store time values
  # in the database in UTC, and return them converted to the specified local zone.
  # Run "rake -D time" for a list of tasks for finding time zone names. Comment line to use default local time.
  config.time_zone = 'UTC'

  # The internationalization framework can be changed to have another default locale (standard is :en) or more load paths.
  # All files from config/locales/*.rb,yml are added automatically.
  # config.i18n.load_path << Dir[File.join(RAILS_ROOT, 'my', 'locales', '*.{rb,yml}')]
  # config.i18n.default_locale = :de

  # Your secret key for verifying cookie session data integrity.
  # If you change this key, all old sessions will become invalid!
  # Make sure the secret is at least 30 characters and all random, 
  # no regular words or you'll be exposed to dictionary attacks.
  config.action_controller.session = {
    :session_key => '_brandwatch_session',
    :secret      => 'aad61a1cd5906ee0f3bb9f6302dee5a86960e92bcd2212209b973708f00a841f512ce4580cc7fa37cf3456d8bc0531594d3a5500a1ae3174c3f264714bbadf3a'
  }

  # Use the database for sessions instead of the cookie-based default,
  # which shouldn't be used to store highly confidential information
  # (create the session table with "rake db:sessions:create")
  # config.action_controller.session_store = :active_record_store

  # Use SQL instead of Active Record's schema dumper when creating the test database.
  # This is necessary if your schema can't be completely dumped by the schema dumper,
  # like if you have constraints or database-specific column types
  # config.active_record.schema_format = :sql

  # Activate observers that should always be running
  # Please note that observers generated using script/generate observer need to have an _observer suffix
  # config.active_record.observers = :cacher, :garbage_collector, :forum_observer
end

Object.const_set('DATA', [{"name"=>"Tamta", "industry"=>"music",
"id"=>"8909818"}, {"name"=>"Telepopmusik", "industry"=>"music",
"id"=>"8909854"}, {"name"=>"The Barracudas", "industry"=>"music",
"id"=>"8872141"}, {"name"=>"The Be Be See ", "industry"=>"music",
"id"=>"8872181"}, {"name"=>"The Beach Boys ", "industry"=>"music",
"id"=>"8871558"}, {"name"=>"The Beatles", "industry"=>"music",
"id"=>"6327849"}, {"name"=>"The Beta Band", "industry"=>"music",
"id"=>"8872321"}, {"name"=>"The Chemical Brothers ",
"industry"=>"music", "id"=>"8872823"}, {"name"=>"The Dandy Warhols ",
"industry"=>"music", "id"=>"8873179"}, {"name"=>"The Decemberists ",
"industry"=>"music", "id"=>"8873210"}, {"name"=>"The Divine Comedy ",
"industry"=>"music", "id"=>"8873307"}, {"name"=>"The Duke Spirit ",
"industry"=>"music", "id"=>"8873320"}, {"name"=>"The Editors",
"industry"=>"music", "id"=>"9049586"}, {"name"=>"The Irrepressibles",
"industry"=>"music", "id"=>"29445530"}, {"name"=>"The Kingston Trio ",
"industry"=>"music", "id"=>"8871509"}, {"name"=>"The Knack ",
"industry"=>"music", "id"=>"8907946"}, {"name"=>"The Magic Numbers ",
"industry"=>"music", "id"=>"8908207"}, {"name"=>"The Sex Pistols",
"industry"=>"music", "id"=>"8909538"}, {"name"=>"The Sleepy Jackson",
"industry"=>"music", "id"=>"8909580"}, {"name"=>"The Smashing Pumpkins", "industry"=>"music", "id"=>"8909595"}, {"name"=>"The Sonic Hearts", "industry"=>"music", "id"=>"8909631"}, {"name"=>"The Stranglers", "industry"=>"music", "id"=>"8909611"}, {"name"=>"The Tea Party", "industry"=>"music", "id"=>"8909839"}, {"name"=>"The Verve",
"industry"=>"music", "id"=>"8921876"}, {"name"=>"The Vines",
"industry"=>"music", "id"=>"8921916"}, {"name"=>"The White Stripes",
"industry"=>"music", "id"=>"8807443"}, {"name"=>"thinkmusic.net",
"industry"=>"music", "id"=>"12864501"}, {"name"=>"Timothy Hodge",
"industry"=>"music", "id"=>"8871765"}, {"name"=>"Toxic Kompulsion",
"industry"=>"music", "id"=>"8922110"}, {"name"=>"KT Tunstall",
"industry"=>"music", "id"=>"8909893"}, {"name"=>"Stephy Tang",
"industry"=>"music", "id"=>"8909342"}, {"name"=>"A Taste of Honey ",
"industry"=>"music", "id"=>"8871910"}, {"name"=>"Antony and the Johnsons", "industry"=>"music", "id"=>"9049654"}, {"name"=>"XX Teens",
"industry"=>"music", "id"=>"8806970"}, {"name"=>"Sir Thomas Beecham",
"industry"=>"music", "id"=>"8922394"}, {"name"=>"Nine Times Bodyweight", "industry"=>"music", "id"=>"8908744"}, {"name"=>"David
Tao ", "industry"=>"music", "id"=>"8873181"}, {"name"=>"Jolin Tsai",
"industry"=>"music", "id"=>"8907813"}, {"name"=>"Vincent Vincent and the Villains", "industry"=>"music", "id"=>"8921900"},
{"name"=>"Richard Thompson", "industry"=>"music", "id"=>"8909877"},
{"name"=>"Grzegorz Turnau", "industry"=>"music", "id"=>"8909912"},
{"name"=>"Nicholas Teo", "industry"=>"music", "id"=>"8908718"},
{"name"=>"King Biscuit Time ", "industry"=>"music",
"id"=>"8872347"}])