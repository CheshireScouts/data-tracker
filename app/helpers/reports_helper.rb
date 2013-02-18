module ReportsHelper

  def current_report_path(organisation_id)
    "/reports/" + action_name + "/#{organisation_id}"
  end

  def membership_report_path(organisation_id)
    "/reports/membership/#{organisation_id}"
  end

  def awards_report_path(organisation_id)
    "/reports/awards/#{organisation_id}"
  end

  def membership_dataset_path(organisation_id)
    "/reports/membership_dataset/#{organisation_id}"
  end

  def awards_dataset_path(organisation_id)
    "/reports/awards_dataset/#{organisation_id}"
  end

  def composite_dataset_path
    "reports/composite_dataset/#{organisation_id}"
  end

  def composite_report_path
    "reports/composite/#{organisation_id}"
  end

  def organisation_tree(organisations)
    organisations.map do |organisation, children|
      render('organisation_menu_item', :organisation => organisation) + content_tag(:div, organisation_tree(children), :class => "child_organisations")
    end.join.html_safe
  end
end
