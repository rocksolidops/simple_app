class ApplicationController < ActionController::Base
  protect_from_forgery

  def append_info_to_payload(payload)
    super
    payload[:host] = request.host
    payload[:ip] = request.remote_ip
    payload[:user_agent] = request.user_agent
  end

end
