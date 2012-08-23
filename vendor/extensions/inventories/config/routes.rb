Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :inventories do
    resources :inventories, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :inventories, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :inventories, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
