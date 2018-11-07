class Profile::DevicesController < ApplicationController
  def index
    @devices = policy_scope(Device).where(user: current_user).order(created_at: :desc)
  end
end
