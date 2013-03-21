use Rack::Static, 
  :urls => ["/css", "/less", "/font", "/img", "/js"],
  :root => "public"

run lambda { |env|
  path = "public" + env["PATH_INFO"]
  if path == "public/" 
    path = "public/index.html"
  end
  puts env
  [
    200, 
    {
      'Content-Type'  => 'text/html', 
      'Cache-Control' => 'public, max-age=10' 
    },
    File.open( path, File::RDONLY)
  ]
}
