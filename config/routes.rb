NJPhASite::Application.routes.draw do
  



  mount Ckeditor::Engine => '/ckeditor'
  
  devise_for :users, :skip => [:registrations] 
  as :user do
    #get 'users/new' => 'devise/registrations#new', :as => 'new_user_registration'
    #post 'users' => 'devise/registrations#create', :as => 'user_registration'
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    put 'users' => 'devise/registrations#update', :as => 'user_registration'
  end
  
  scope '/cpanel' do 
    resources :pages, only: [:index, :new, :create, :edit, :destroy, :update]  do
      resources :callout_assignments
      get 'duplicate' => 'pages#duplicate'
    end
    resources :settings, only: [:index, :update, :edit]
    resources :callouts
    resources :award_nominations
    resources :journal_articles
    resources :member_momenta
    resources :blogs do
      resources :blog_posts, only: [:index, :new, :create, :edit, :destroy, :update]
    end
    resources :faculty_proposals    
  end 
  
  post '/resources/faculty_proposals' => 'faculty_proposals#create',:as => 'create_proposel'
 





  
  resources :pages, only: [:show,:home,:error_404,:error_500]

  get '/show_pdf' => 'pages#show_pdf'
  post '/process_nomination' => 'award_nominations#create'
  post '/process_journal_article' => 'journal_articles#create'
  get '/finalize_logout' => 'pages#finalize_logout'
  get '/process_login' => 'pages#check_login'
  get '/logout_member' => 'pages#logout_member'
  post '/search_results' => 'pages#search_results'
  get '/search_results' => 'pages#search_results'

  get '/blogs/:blog_url_alias' => 'blog_posts#index'
  
  get '/blogs/:blog_url_alias/:post_url_alias' => 'blog_posts#show'
  get '/*path' => 'pages#show', constraints: lambda { |req|
      pg_alias = req.params[:path].split('/').last
      route_pg = Rails.cache.fetch([pg_alias,"page_alias"]) { Page.where(url_alias: pg_alias).first }
      !route_pg.nil?
    }

  if Rails.env.production?
   get '404', :to => 'pages#error_404'
   get '422', :to => 'pages#error_500'
   get '500', :to => 'pages#error_500'
  end
  
  root to: 'pages#show'
  get "*path", :to => "pages#error_500"

end
