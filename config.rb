# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

configure :development do
  activate :deploy do |deploy|
    deploy.deploy_method = :git
    # Optional Settings
    # deploy.remote   = 'custom-remote' # remote name or git url, default: origin
    deploy.branch = 'master' # default: gh-pages
    # deploy.strategy = :submodule      # commit strategy: can be :force_push or :submodule, default: :force_push
    # deploy.commit_message = 'custom-message'      # commit message (can be empty), default: Automated commit at `timestamp` by middleman-deploy `version`
  end

  activate :disqus do |d|
    d.shortname = nil
  end

  activate :livereload
end

# Build-specific configuration
configure :build do
  config[:host] = "http://nizovtsevnv.github.io"

  #activate :asset_hash

  activate :disqus do |d|
    d.shortname = 'nizovtsevnvinfo'
  end

  activate :google_analytics do |ga|
    ga.tracking_id = 'UA-7867765-20'
  end

  #activate :gzip
  activate :minify_css
  activate :minify_html
  activate :minify_javascript
  activate :relative_assets

  set :relative_links, true
end

activate :i18n

activate :blog do |blog|
  #blog.name = 'en'
  #blog.prefix = 'blog/en'
  blog.prefix = 'blog'
  blog.permalink = "{year}/{month}/{day}/{title}.html"
  blog.sources = "{year}-{month}-{day}-{title}.html"
  blog.layout = "blog"
  blog.summary_separator = /(\^\^\^)/
  blog.summary_length = 500
  blog.taglink = "tags/{tag}/index.html"
  blog.year_link = "{year}/index.html"
  blog.month_link = "{year}/{month}/index.html"
  blog.day_link = "{year}/{month}/{day}/index.html"
  blog.default_extension = ".haml"
  blog.tag_template = "templates/tag.html"
  blog.calendar_template = "templates/calendar.html"

  blog.paginate = true
  blog.per_page = 10
  blog.page_link = "{lang}/page/{num}"
end

activate :favicon_maker do |f|
  f.template_dir  = File.join(root, 'source')
  f.output_dir    = File.join(root, 'build')

  f.icons = {'favicon.png' =>
    ['152x152','144x144','120x120','114x114','76x76','72x72','60x60','57x57'].map{|size|
      {icon: "apple-touch-icon-#{size}-precomposed.png"}
    } <<
    {icon: 'favicon.png', size: '64x64'} <<
    {icon: 'favicon.ico', size: '64x64,32x32,24x24,16x16'}
  }
end

activate :meta_tags
activate :syntax
