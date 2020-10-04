json.extract! project, :id, :title, :description, :project_url, :last_updated, :progression_percent, :created_at, :updated_at
json.url project_url(project, format: :json)
