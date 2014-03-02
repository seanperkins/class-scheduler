require 'rake'

namespace :db do
  desc "Drop, create, and generate test data"
  task :initialize_dev do
    Rake::Task['db:drop'].invoke
    Rake::Task['db:create'].invoke
    Rake::Task['db:schema:load'].invoke
    Rake::Task['db:seed'].invoke
  end
end