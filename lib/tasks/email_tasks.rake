namespace :emails do
  desc "Send weekly email reports to users"
  task send_weekly_reports: :environment do
    puts "Starting weekly email report task..."
    WeeklyEmailTask.new.run
    puts "Weekly email report task completed!"
  end
end
