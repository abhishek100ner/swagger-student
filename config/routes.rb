Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  mount_devise_token_auth_for 'User', at: 'auth'
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :semesters do
        resources :students
      end
    end
  end
end
