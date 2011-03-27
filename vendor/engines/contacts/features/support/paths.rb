module NavigationHelpers
  module Refinery
    module Contacts
      def path_to(page_name)
        case page_name
        when /the list of contacts/
          admin_contacts_path

         when /the new contact form/
          new_admin_contact_path
        else
          nil
        end
      end
    end
  end
end
