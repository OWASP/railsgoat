class TutorialsController < ApplicationController
  
  skip_before_filter :authenticated
  
  def index
  end
  
  def show
    render "injection"
  end
  
  def injection
  end
  
  def xss
  end
  
  def broken_auth
  end
  
  def insecure_dor
  end
  
  def csrf
  end
  
  def misconfig
  end
  
  def crypto
  end
  
  def url_access
  end
  
  def ssl_tls
  end
  
  def redirects
  end
  
end
