Rails.application.routes.draw do
  resources :issues do
    Issue::STATUSES.each do |status|
      patch status, on: :member
    end
  end

  root to: 'issues#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'
end
