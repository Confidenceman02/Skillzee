json.extract! profile, :id, :user_id, :first_name, :gender, :avatar, :created_at, :updated_at
json.url profile_url(profile, format: :json)
