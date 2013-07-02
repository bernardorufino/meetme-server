namespace :scheduler do
  desc "Scheduler"

  task :clean_groups => :environment do
    Group.where("updated_at <= ?", Group::INACTIVITY_TIME.ago).destroy_all
  end

end
