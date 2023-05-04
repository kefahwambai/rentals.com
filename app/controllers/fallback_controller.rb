class FallbackController < ActionController::Base
  def index
    render file: "#{Rails.root}/public/index.html"
  end
end
