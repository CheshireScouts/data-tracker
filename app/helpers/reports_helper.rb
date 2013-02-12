module ReportsHelper
  def membership_report_path(organisation_id)
    "/reports/membership/#{organisation_id}"
  end

  def membership_dataset_path(organisation_id)
    "/reports/membership_dataset/#{organisation_id}"
  end

  def organisation_tree(organisations)
    organisations.map do |organisation, children|
      render('organisation_menu_item', :organisation => organisation) + content_tag(:div, organisation_tree(children), :class => "child_organisations")
    end.join.html_safe
  end
end
