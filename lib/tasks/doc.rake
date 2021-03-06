require 'rdoc/task'
require 'rails/tasks'

Rake::Task["doc:app"].clear

namespace :doc do
  RDoc::Task.new :app do |rdoc|
    rdoc.rdoc_dir = 'doc'
    rdoc.title    = 'By Fire Be Purged'
    rdoc.main     = 'README.md'
    rdoc.generator = 'hanna'

    rdoc.options << '--charset' << 'utf-8'

    rdoc.rdoc_files.include('app/**/*.rb')
    rdoc.rdoc_files.include('config/initializers/exceptions.rb')
    rdoc.rdoc_files.include('config/initializers/omniauth.rb')
    rdoc.rdoc_files.include('lib/**/*.rb')
    rdoc.rdoc_files.include('README.md')
  end

  desc "Deploy the documentation to github"
  task :deploy => :app do
    Dir.chdir('doc') do
      `git clone git@github.com:kelsin/docs.byfirebepurged.com.git -n temp`
      `mv temp/.git .git`
      `rm -rf temp`
      `echo "docs.byfirebepurged.com" > CNAME`
      `git add -A`
      `git commit -m "Updating docs: #{Time.now.utc}"`
      `git push`
      `rm -rf .git`
    end
  end
end
