class ApplicationController < ActionController::Base
  include SessionsHelper
  include CurrentCart
  before_action :set_current_cart
end
