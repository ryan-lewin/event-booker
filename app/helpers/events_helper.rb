module EventsHelper

  def event_params
    params.require(:event).permit(:title, :description, :date)
  end

  def owner_id
    return session[:user_id]
      #   @current_user ||= User.find(session[:user_id])
      # else
      #   @current_user = nil
      # end
  end

end
