class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def authenticate
    logger.info "Authentication checked before accessing image"
    # run whatever checks are necessary to prove the user has access to this file.
  end
    
end
