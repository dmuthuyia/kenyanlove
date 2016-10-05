  Rails.application.routes.draw do


  get 'send_us_mails/new'

  get 'send_us_mails/create'

devise_for :users, controllers: { registrations: 'registrations' }

  devise_scope :user do
    authenticated :user do
      get '/users/sign_out' => 'devise/sessions#destroy'
      root 'dds#home', as: :authenticated_root
    end

    unauthenticated do
      #root 'devise/sessions#new', as: :unauthenticated_root
      #root 'dds#home', as: :authenticated_root
    end
  end

#resources :dds
#resources :dds do
#post :about_us
#get :about_us, only: :index
#end

  #get "/about_us", to: "dds#about_us", as: :about_us

  DdsController.action_methods.each do |action|
    get "/#{action}", to: "dds##{action}", as: "#{action}"
  end

root 'dds#home'

resources :blogs
resources :careers
resources :pictures
resources :products
resources :cans

match '/send_us_mails',     to: 'send_us_mails#new',             via: 'get'
resources :send_us_mails, only: [:new, :create]

#match 'users/:id' => 'users#show', via: :get
#get 'users/:id' => 'users#show', as: :user
resources :users, only: [:index, :show] do
#get 'users/:id' => 'users#show'
  	member do
  		get "like", to: "users#upvote"
  		get "dislike", to: "users#downvote"
  	end
  
  end

  resources :products do
    member do
      get "like", to: "products#upvote"
      get "dislike", to: "products#downvote"
    end
    resources :comments
  end

get "/my_profile" => "users#my_profile"

resources :payments


match '/contactforms',     to: 'contactforms#new',             via: 'get'
resources "contactforms", only: [:new, :create]


resources :prod, only: [:index]
resource :cart, only: [:show]
resources :order_items, only: [:create, :update, :destroy]

#get send_can_mail, to: 'users_controller#send_can_mail', as: :send_can_mail
#get :send_can_mail, to: 'users#show', as: :send_can_mail
#get :create, to: 'cans#create', as: :create
get "/sending_can" => "cans#sending_can"


match "/404" => "errors#error404", via: [ :get, :post, :patch, :delete ]

end
