require 'active_record'

options = {
  adapter: 'postgresql',
  database: 'dbargainz'
}

ActiveRecord::Base.establish_connection(options)
