module ApplicationHelper
  def class_active
    "active"
  end

  def active_home
    #class_active if current_page?(root_path)
    class_active if controller.controller_name == "home"
  end

  def active_authors
    #class_active if current_page?(authors_path)
    class_active if controller.controller_name == "authors"
  end

  def active_books
    #class_active if current_page?(books_path)
    class_active if controller.controller_name == "books"    
  end

end
