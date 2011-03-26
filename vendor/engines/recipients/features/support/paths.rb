module NavigationHelpers
  module Refinery
    module Recipients
      def path_to(page_name)
        case page_name
        when /the list of recipients/
          admin_recipients_path

         when /the new recipient form/
          new_admin_recipient_path
        else
          nil
        end
      end
    end
  end
end
