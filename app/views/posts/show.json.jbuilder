json.post_id @post.id
json.user_name @post.user.name
json.user_rating @post.user.average_rating
json.created_at @post.created_at
json.title @post.title
json.body @post.body

json.commets @post.comments.includes(:user).order(created_at: :desc) do |comment|
    json.message comment.message
    json.user_name comment.user.name
    json.user_average_rating comment.user.average_rating
    json.created_at comment.created_at
end
