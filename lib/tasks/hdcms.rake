namespace :db do
  desc 'heroku pg:reset, migrate, seed'
  task hdcms: :environment do
    exec('heroku pg:reset --app mapc-scraper --confirm mapc-scraper
      heroku run rake db:migrate --app mapc-scraper
      heroku run rake db:seed --app mapc-scraper')
  end
end
