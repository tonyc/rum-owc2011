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
  
  def progress_thermometer(campaign)
    return <<-EOS
      <section>
        <div>
          #{campaign.name} needs: #{number_to_currency(campaign.target_level, :unit => '$')}<br/>
          Total Earned: #{number_to_currency(campaign.payment_total, :unit => '$')}
        </div>
        <div>
          <img src="/images/thermo/#{determine_thermometer_image(campaign)}">
        </div>
        <div>
      </section>
    EOS
  end
  
  def determine_thermometer_image(campaign)
    total = campaign.payment_total
    if campaign.target_level == 0
      return "step1.png"
    elsif total >= campaign.target_level
      return "step8.png"
    elsif total > campaign.target_level / 2
      return "step7.png"
    elsif total > campaign.target_level / 2.8
      return "step6.png"
    elsif total > campaign.target_level / 6
      return "step5.png"
    elsif total > campaign.target_level / 8
      return "step4.png"
    elsif total > campaign.target_level / 8.6
      return "step3.png"
    elsif total > campaign.target_level / 9
      return "step2.png"
    else
      return "step1.png"
    end
  end
  
end
