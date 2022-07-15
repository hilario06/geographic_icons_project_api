class ApplicationController < ActionController::API
  before_action :switch_locale

  def switch_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def authenticate_user!
    token_request = search_token_request(request.headers)
    if token_request
      token = Token.find_by(token: token_request)
      if token
        @current_user = token.user
        return
      end
    end
    head :unauthorized
  end

  private

  def search_token_request headers
    return nil unless headers['Authorization']
    match = headers['Authorization'].match(/Bearer (\w+)/) # si hace math nos regresara la coincidencia y obtendremos el token sino nil
    match[1] if match # en el indice 1 estara el token
  end
end
