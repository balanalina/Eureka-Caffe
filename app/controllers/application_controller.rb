class ApplicationController < ActionController::Base
  include SessionsHelper
  include CartsHelper
  before_action :set_current_cart
end
