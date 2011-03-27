module NavigationHelpers
  module Refinery
    module Campaigns
      def path_to(page_name)
        case page_name
        when /the list of campaigns/
          admin_campaigns_path

         when /the new campaign form/
          new_admin_campaign_path
        else
          nil
        end
      end
    end
  end
end
