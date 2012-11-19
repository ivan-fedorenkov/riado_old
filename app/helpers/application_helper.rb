module ApplicationHelper
  @@flash_classes =
    {:notice  => 'alert-info',
     :alert   => 'alert-error',
     :success => 'alert-success'}

  def flash_class_for(key)
    @@flash_classes[key]
  end

  def highlight_acol_prefix(acol_name)
    if (m = acol_name.match(/^(#{Acol.model_name.human})(.*)$/))
      return "<strong>#{m[1]}</strong>#{m[2]}"
    else
      return acol_name
    end
  end
end
