require 'bundler/setup'
require 'rack/rewrite'

user Rack::Rewrite do
  rewrite '/:filename', '/public/index.html'
end

use Rack::Static, :urls => ['/image/'], :root => "image"
use Rack::Static, :urls => ['/script/'], :root => "script"
use Rack::Static, :urls => ['/style/'], :root => "style"
run Rack::Directory.new "image"
run Rack::Directory.new "script"
run Rack::Directory.new "style"