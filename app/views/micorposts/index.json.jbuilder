json.array!(@micorposts) do |micorpost|
  json.extract! micorpost, :id, :content, :user_id
  json.url micorpost_url(micorpost, format: :json)
end
