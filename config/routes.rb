Rails.application.routes.draw do
	get '/docs' => redirect('/swagger/dist/index.html?url=/apidocs/api-docs.json')
  mount_devise_token_auth_for 'User', at: 'auth'
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :semesters
      resources :students
    end
  end
end
