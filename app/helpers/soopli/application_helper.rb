module Soopli
  module ApplicationHelper
    def alert_class_for(flash_type)
      {
          :success => 'alert-success',
          :error => 'alert-danger',
          :alert => 'alert-warning',
          :notice => 'alert-info'
      }[flash_type.to_sym] || flash_type.to_s
    end
    
    def status_class_for(status)
      case status
      when 1
        'badge badge-warning'
      when 2
        'badge badge-success'
      when 3
        'badge badge-default'
      end
    end
    
    def current_menu_for(option)
      if option = controller_name
        "<span class='sr-only'>(current)</span>".html_safe
      end
    end
  end
end
