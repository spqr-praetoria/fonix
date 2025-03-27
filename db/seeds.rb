Channel.find_or_create_by!(name: "General") do |channel|
  channel.description = "General discussions"
  channel.created_at = Time.now
end

# Cleanup
# User.delete_all
# Channel.delete_all
# Message.delete_all

# # Create users
# 8.times do |i|
#   email = "user_#{i}@example.com"
#   username = "#{Faker::Name.first_name} #{Faker::Name.last_name}"

#   FactoryBot.create(:user, email: email, username: username)
# end

# puts "Created #{User.count} users"

# # Create One channel
# Channel.create!(
#   name: "General",
#   description: "Mobile payments & interactive services",
#   created_at: Faker::Time.between(from: 1.year.ago, to: Time.current)
# )

# puts "Created channel"

# # Create messages
# channel = Channel.first
# users = User.all.to_a

# 150.times do |i|
#   Message.create!(
#     content: "Message #{i+1}",
#     user: users.sample,
#     channel: channel,
#     created_at: Faker::Time.between(from: 2.day.ago, to: Time.current)
#   )
# end

# puts "Created #{Message.count} messages"
