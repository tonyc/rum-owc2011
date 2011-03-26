module NavigationHelpers
  module Refinery
    module Payments
      def path_to(page_name)
        case page_name
        when /the list of payments/
          admin_payments_path

         when /the new payment form/
          new_admin_payment_path
        else
          nil
        end
      end
    end
  end
end
