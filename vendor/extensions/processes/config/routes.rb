Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :processes do
    resources :processes, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :processes, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :processes, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
