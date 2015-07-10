class AdminController < ApplicationController
  before_filter :ensure_admin!, except: [:index, :show]

  private

  def ensure_admin!
    unless current_user.admin?
      flash[:alert] = "You do not have the permissions to perform that action"
      redirect_to root_path

      return false
    end
  end
end
