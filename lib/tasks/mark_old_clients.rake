namespace :clients do
  desc "Mark all clients created before today as old"
  task mark_old: :environment do
    Client.where("created_at < ?", Time.zone.now.beginning_of_day).update_all(is_old: true)
    puts "Marked old clients successfully"
  end
end
