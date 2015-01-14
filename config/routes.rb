DemoList::Application.routes.draw do
  devise_for :users

  namespace :api, defaults: {format: :json} do
    devise_scope :user do
      resource :session, only: [:create, :destroy]
    end
    resources :lists
  end

  root :to => "home#index"

  get '/dashboard' => 'templates#index'
  get '/lists/:id' => 'templates#index'
  get '/templates/:path.html' => 'templates#template', :constraints => { :path => /.+/  }
  post '/generate_pdf' => 'templates#generate_pdf'
end
