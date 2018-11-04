class WelcomeController < ApplicationController
  def index
    @usuarios=Usuario.all
    @tareas=Tarea.all
  end
  def new
    @var_session = params[:session]
    @var_usuario_elegido = @var_session['usuario_elegido']
    @var_password_escrito = @var_session['password_escrito']

    if user = Usuario.find_by(usu_nombre: @var_usuario_elegido, usu_password: @var_password_escrito) #le paso los datos del form y busco en el modelo usuarios
      session[:current_user_id] = user.usu_id
      redirect_to tareas_path
    else
      @usuarios=Usuario.all #para que no me de error cuando hago el render sin declarar la variable que ya tengo en el method index de este controller
      @errorlogin = "Error de inicio intente de nuevo"
      render "index"
    end
  end
  #trabajo los datos de la sesion, cuando
  #hago click en submit del form me toma por defecto la accion new del controller
  #por eso lo uso para hacer otra cosa que no es new nada sino controlar la sesion, no estoy usando .save
  #como se hace usualmente en esta accion "create" predefinida de rails
  def create
    
  end

  def destroy
    # cierro la sesion con el metodo delete
    @_current_user = session[:current_user_id] = nil
    redirect_to root_url
  end
end
