namespace :scheduler do
  desc "Scheduler"

  task :clean_groups => :environment do
    deleted_groups = Group.clean
    puts "#{deleted_groups.count} groups were deleted"
  end

end
