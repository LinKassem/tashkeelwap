module DeviseHelper
  def devise_error_messages!
    return "" if resource.errors.empty?
    devise_error_messages?
    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    sentence = I18n.t("errors.messages.not_saved",
                      :count => resource.errors.count,
                      :resource => resource.class.model_name.human.downcase)

    html = <<-HTML
    <div id="display-devise-errors-signup" class="alert-box alert radius">
      <ul><small><bdi>#{messages}</bdi></small></ul>
    </div>
    HTML
    html.html_safe
  end

  def devise_error_messages?
    resource.errors.empty? ? false : true
  end

end