class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  def logo
    image_tag("logo.png", :alt => "Sample App", :class => "round")
  end

end
