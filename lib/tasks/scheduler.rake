desc "This task is called by the Heroku scheduler add-on"
task :update_feed => :environment do
  puts "Updating feed..."
  #NewsFeed.update
  puts "done."
end

desc "Fetch user data from github"
task :fetch_china_datas => :environment do
  #User.send_reminders
  puts 'User fetch data'
  User.fetch_china_datas 1
end