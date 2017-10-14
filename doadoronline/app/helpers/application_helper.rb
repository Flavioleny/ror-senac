module ApplicationHelper
  def class_active
    "active"
  end

  def active_home
    class_active if controller.controller_name == "home"
  end

  def active_posts
    class_active if controller.controller_name == "posts"
  end

  def active_orders
    class_active if controller.controller_name == "orders"
  end

  def active_contacts
    class_active if controller.controller_name == "contacts"
  end

end
