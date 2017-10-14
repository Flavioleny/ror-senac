class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_action :authenticate_user!
  #
  # rescue_from CanCan::AccessDenied do |exception|
  #   #redirect_to root_path,
  #   redirect_to "/",
  #   notice: "Você não tem permissão para acessar essa pagina"
  # end
end
