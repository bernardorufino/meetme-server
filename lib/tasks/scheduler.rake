namespace :scheduler do
  desc "Scheduler"

  task :clean_groups => :environment do
    Group.clean
  end

end
