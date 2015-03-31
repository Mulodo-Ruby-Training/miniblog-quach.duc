module ApplicationHelper
  # Return path (view or controller) of current page
  def current_path(type)
    case type
    when "controller"
      request.fullpath.split("?")[0]
    when "action"
      request.fullpath.split("/")[1]
    end
  end

  # Return current path
  def current_page_path
    case request.filtered_parameters["controller"]
    when "home"
      " - Home"
    when "users"
      " - User"
    when "sessions"
      " - User"
    when "posts"
      " - Post"
    end
  end
end
