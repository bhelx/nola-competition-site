require 'rubygems'
# Rack config

# Look for index files in folders like Apache
require "rack/contrib/try_static"
use Rack::TryStatic, :root => "build", :urls => %w[/], :try => ['.html', 'index.html', '/index.html']

# Cache static assets
require "rack/contrib/static_cache"
use Rack::StaticCache, :urls => ['/'], :root => 'build'

run lambda { |env| [404, {'Content-Type'=>'text/html'}, File.new("./build/404.html")] }
