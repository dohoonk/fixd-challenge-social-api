json.user_id @user.id
json.user_name @user.name
json.user_rating @user.average_rating
json.github_user_name @user.github_username

json.activities @user.activity_logs.includes(:subject).order(created_at: :desc) do |activities|
    json.activity activities
    json.activity_detail activities.subject
end
