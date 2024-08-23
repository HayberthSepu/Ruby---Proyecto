Rails.application.routes.draw do
  defaults format: :json do
    resources :clients, only: [ :index, :show, :create, :update, :destroy ] # Define las rutas para la gestión de recursos de usuarios (users) en la aplicación, Solo se definen las rutas para los métodos específicos: index, show, create, update, destroy.
  end
end
