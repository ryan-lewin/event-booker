module EventsHelper

  def event_params
    params.require(:event).permit(:title, :description, :date, :owner_id)
  end

end
