Rails.application.routes.draw do

  get '/welcome', to: 'welcome#index'

  post '/welcome', to: 'welcome#new' #el boton submit del form me manda por post en /welcome
  # si pongo to: 'welcome#index' podria usar las variables @ en el index y no tendria que 
  #haber hecho la prueba con la vista new de welcome que en realidad no necesito en este proyecto

  get '/tareas', to: 'tareas#index' #si los datos de user son correctos me lleva a esta ruta y controlador
  #para listar las tareas y empezar con el CRUD y otras funcionalidades mas

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
