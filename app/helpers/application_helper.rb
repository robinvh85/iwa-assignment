module ApplicationHelper
  def menu_active(menu_name)
    'active' if controller_name == menu_name
  end
end
