module HomeHelper
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

def devise_flash
  if controller.devise_controller? && resource.errors.any?
    flash.now[:error] = flash[:error].to_a.concat resource.errors.full_messages
    flash.now[:error].uniq!
  end
end
	# def devise_error_messages!
	# 	bindin.pry
 #    flash_alerts = []
 #    error_key = 'errors.messages.not_saved'

 #    if !flash.empty?
 #      flash_alerts.push(flash[:error]) if flash[:error]
 #      flash_alerts.push(flash[:alert]) if flash[:alert]
 #      flash_alerts.push(flash[:notice]) if flash[:notice]
 #      error_key = 'devise.failure.invalid'
 #    end

 #    return "" if resource.errors.empty? && flash_alerts.empty?
 #    errors = resource.errors.empty? ? flash_alerts : resource.errors.full_messages

 #    messages = errors.map { |msg| content_tag(:li, msg) }.join
 #    sentence = I18n.t(error_key, :count    => errors.count,
 #                                 :resource => resource.class.model_name.human.downcase)

 #    # html = <<-HTML
 #    # <div id="error_explanation">
 #    #   <h2>#{sentence}</h2>
 #    #   <ul>#{messages}</ul>
 #    # </div>
 #    # HTML

 #    if flash[:error]
	# 	<<-HTML
 #    	<div id="error_explanation">
	# 	<div class="alert alert-danger">
	# 	  <strong>Danger!</strong> #{messages}
	# 	</div>
	# 	</div>
	# 	HTML
	# end
		
	# if flash[:alert]
	# 	<<-HTML
	# 	<div class="alert alert-info">
	# 	  <strong>Info!</strong> Indicates a neutral informative change or action.
	# 	</div>
	# 	HTML
	# end
		
	# <<-HTML
	# <div class="alert alert-warning">
	#   <strong>Warning!</strong> Indicates a warning that might need attention.
	# </div>
	# HTML

	# <<-HTML
	# <div class="alert alert-danger">
	#   <strong>Danger!</strong> Indicates a dangerous or potentially negative action.
	# </div>
	# HTML
 #    html.html_safe
 #  end
end
