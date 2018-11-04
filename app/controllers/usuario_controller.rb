class UsuarioController < ApplicationController
  def index
    @probando = "usuariocontroller"
    render "welcome/index"
  end

  def create
    
  end
end
