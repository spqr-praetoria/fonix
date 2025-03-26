module ApplicationHelper
  def current_page?(controller, action = nil)
    if action
      controller.to_s == controller_name && action.to_s == action_name
    else
      controller.to_s == controller_name
    end
  end
end
