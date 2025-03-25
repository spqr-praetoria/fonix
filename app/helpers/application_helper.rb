module ApplicationHelper
  def current_page?(controller, action = nil, **options)
    if options.present?
      controller_match = options[:controller].to_s == controller_name if options[:controller]
      action_match = options[:action].to_s == action_name if options[:action]

      if options[:controller] && options[:action]
        controller_match && action_match
      elsif options[:controller]
        controller_match
      elsif options[:action]
        action_match
      else
        false
      end
    else
      if action
        controller.to_s == controller_name && action.to_s == action_name
      else
        controller.to_s == controller_name
      end
    end
  end
end
