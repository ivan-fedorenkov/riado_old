module ApplicationHelper
  @@flash_classes =
    {:notice  => 'alert-info',
     :alert   => 'alert-error',
     :success => 'alert-success'}

  def flash_class_for(key)
    @@flash_classes[key]
  end
end
