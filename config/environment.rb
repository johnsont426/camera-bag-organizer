require 'bundler'

Bundler.require

ActiveRecord::Base.establish_connection(
	:adapter => "sqlite3",
	:database => "db/development.sqlite"
)

ActiveSupport::Inflector.inflections do |inflect|
	inflect.irregular 'lens', 'lenses'
end

require_all 'app'