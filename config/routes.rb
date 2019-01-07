Rails.application.routes.draw do
   
  devise_for :user, :controllers => { registrations: 'registrations' }

  authenticate :user do
  	get "welcome/index", 'welcome#index'
  end

  root "coding#index"
	  #root 'welcome#index'
	  
	  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
