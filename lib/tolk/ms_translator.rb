module Tolk
  module MsTranslator
    def self.included(base)
      base.send :extend, ClassMethods               
    end
    
    module ClassMethods                               

      def ms_translator_enabled
        if self.ms_enabled
          unless self.ms_client_secret.blank? or self.ms_client_id.blank?
            return true
          end
        end                            
      end
      
    end
  end
end
 