module ApplicationHelper
  
  def active_tag(active)
    active ? "active" : "inactive"
  end
  
  def top_level_pages
    @menu_pages.includes(:slugs).select { |p| p.parent_id.nil? }
  end
  
  def top_level_pages_without_home
    top_level_pages.reject { |p| p.title == "Home"}
  end
  
end
