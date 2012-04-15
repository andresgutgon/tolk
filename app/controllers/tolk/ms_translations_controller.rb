module Tolk
  class MsTranslationsController < Tolk::ApplicationController      

    def translate         
      # require 'ms_translate'      
      debugger     
                                                       
      @data = {:error => false}
      begin
        # translated_text = MsTranslate::Api.translate(params[:text],{:from => params[:from], :to => params[:to]})        
        translated_text = Tolk::Locale.ms_translate(params[:text],{:from => params[:from], :to => params[:to]})
      rescue Tolk::Locale::MS_InvalidClientSecret
        @data[:error] = true
        @data[:error_text] = "Your Microsoft Oauth Client Secret is incorrect."
      rescue Tolk::Locale::MS_InvalidClientId
        @data[:error] = true
        @data[:error_text] = "Your Microsoft Oauth Client ID is incorrect."
      rescue => error
        @data[:error] = true
        @data[:error_text] = error
      else
        @data[:translated_text] = translated_text        
      ensure
        respond_to do |format|
          format.json { render :json => @data }
        end         
      end      
    end

  end
end