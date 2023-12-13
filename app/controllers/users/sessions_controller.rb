# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  def after_destroy_user_session_path_for(resource)
    new_user_session_path
  end
end
