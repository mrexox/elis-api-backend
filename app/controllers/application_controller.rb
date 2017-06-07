class ApplicationController < ActionController::API
  before_action :authenticate_request
  attr_reader :currend_user

  def rj(object, status=:ok) # simplier than render json: ...
    render json: object, status: status
  end

  private

  def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers).result
    render json: { error: 'Not Authorized' }, status: :unauthorized unless @current_user
  end


#  def cors_preflight_check
#    if request.method == :options
#      headers['Access-Control-Allow-Origin'] = '*'
#      headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
#      headers['Access-Control-Request-Method'] = '*'
#      headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
#    end
#  end
end
