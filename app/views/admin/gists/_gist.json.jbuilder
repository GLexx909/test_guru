json.extract! gist, :id, :url, :user_id, :question_id, :created_at, :updated_at
json.url gist_url(gist, format: :json)
