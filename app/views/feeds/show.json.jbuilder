json.user_id @user.id
json.user_name @user.name
json.user_rating @user.average_rating
json.github_user_name @user.github_username
json.activity_log_count @activity_logs.count

json.activities @activity_logs.order(created_at: :desc) do |activity|
    json.activity activity
    json.activity_detail activity.subject
end

json.options @options