module ApplicationHelper
  def facon(name, size = "2x")  
    %(<i class="fa fa-#{name} fa-#{size}" aria-hidden="true"></i>).html_safe
  end
end
