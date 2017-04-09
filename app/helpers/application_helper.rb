module ApplicationHelper

  def full_title(page_title = '')
    base_title = "Dislike"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def active_class(route)
    if route == "votes" || route == "topics" ||  route== "maps"
      current_page?(route) ? "active" : ""
    end
  end

end
