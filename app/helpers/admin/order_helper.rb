module Admin::OrderHelper
  def render_approval approval
    html = []
    approval == 1 ? html << "<div class='badge bg-success'>approved</div>".html_safe : html << "<div class='badge bg-warning'>pending</div>".html_safe
    safe_join(html)
  end
end
