module NavigationHelpers
  module Refinery
    module Applicants
      def path_to(page_name)
        case page_name
        when /the list of applicants/
          admin_applicants_path

         when /the new applicant form/
          new_admin_applicant_path
        else
          nil
        end
      end
    end
  end
end
