require 'susy'
require 'kramdown'



# Page options, layouts, aliases and proxies
# - - -

# page "/index.html", :layout => "top"
# page "404.html", :layout => false, directory_index: false
# page "/sitemap.xml", :layout => "sitemap.xml"
# page "/feed.rss", :layout => "feed.rss"
# page "/atom.xml", :layout => "atom.xml"

# With no layout
# page "/path/to/file.html", :layout => false

# Proxy pages (http://middlemanapp.com/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }







# Helpers
# - - -

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes









# Blog settings
# - - -

Time.zone = "Tokyo"

activate :blog do |blog|
  # This will add a prefix to all links, template references and source paths
  # blog.prefix = "blog"

  # blog.permalink = "{category}/{title}.html"
  # Matcher for blog source files
  blog.sources = "posts/{year}-{month}-{day}-{title}.html"
  blog.permalink = "{category}/{title}.html"
  blog.taglink = "tags/{tag}.html"
  # blog.layout = "layout"
  # blog.summary_separator = /(READMORE)/
  # blog.summary_length = 250
  blog.year_link = "{year}.html"
  blog.month_link = "{year}/{month}.html"
  blog.day_link = "{year}/{month}/{day}.html"
  blog.default_extension = ".md"

  # blog.tag_template = "tag.html"
  # blog.calendar_template = "calendar.html"

  # Enable pagination
  blog.paginate = true
  blog.per_page = 5
  blog.page_link = "page/{num}"
end






# Deploy process
# - - -

activate :deploy do |deploy|
  deploy.method = :git
  # Optional Settings
  # deploy.remote   = "custom-remote" # remote name or git url, default: origin
  # deploy.branch   = "custom-branch" # default: gh-pages
  # deploy.strategy = :submodule      # commit strategy: can be :force_push or :submodule, default: :force_push
  deploy.build_before = true # default: false
end










# Reload the browser automatically whenever files change
# - - -

activate :livereload










# Image Optimizer
# - - -

activate :imageoptim do |options|
  # print out skipped images
  options.verbose = false

  # Setting these to true or nil will let options determine them (recommended)
  options.nice = true
  options.threads = true

  # Image extensions to attempt to compress
  options.image_extensions = %w(.png .jpg .gif)

  # compressor worker options, individual optimisers can be disabled by passing
  # false instead of a hash
  options.pngcrush_options  = {:chunks => ['alla'], :fix => false, :brute => false}
  #options.pngout_options    = {:copy_chunks => false, :strategy => 0}
  options.optipng_options   = {:level => 6, :interlace => false}
  options.advpng_options    = {:level => 4}
  options.jpegoptim_options = {:strip => ['all'], :max_quality => 80}
  options.jpegtran_options  = {:copy_chunks => false, :progressive => true, :jpegrescan => true}
  options.gifsicle_options  = {:interlace => false}
end









# Markdown
# - - -
#
# Reason why I use kramdown:
# http://benhollis.net/blog/2013/10/20/maruku-is-obsolete/
# http://stackoverflow.com/questions/2017001/adding-a-class-attribute-to-a-hyperlink-in-markdown

set :markdown, :tables => true, :autolink => true, :gh_blockcode => true, :fenced_code_blocks => true, :with_toc_data => true, :smartypants => true
set :markdown_engine, :kramdown













# Autoprefixer
# - - -
#
# https://github.com/porada/middleman-autoprefixer
activate :autoprefixer do |config|
  config.browsers = ['last 2 versions', 'Explorer >= 8']
  config.cascade  = false
end







# Set directions
# - - -

set :css_dir, 'assets/stylesheets'
set :js_dir, 'assets/javascripts'
set :images_dir, 'assets/images'
set :fonts_dir, 'assets/fonts'

set :layouts_dir, 'layouts'
set :partials_dir, 'partials'









# Pretty URLs
# - - -

activate :directory_indexes










# Build-specific configuration
# - - -

configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Image Optim
  activate :imageoptim

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  activate :relative_assets

  activate :favicon_maker, :icons => {
    "favicon.png" => [
      { icon: "apple-touch-icon-152x152-precomposed.png" },
      { icon: "apple-touch-icon-120x120-precomposed.png" },
      { icon: "apple-touch-icon-76x76-precomposed.png" },
      { icon: "apple-touch-icon-precomposed.png", size: "16x16" },
      { icon: "favicon.ico", size: "64x64,32x32,24x24,16x16" }

    ]
  }


end
