class ReportsController < ApplicationController
  load_and_authorize_resource

  def membership
  end

  def pivot
    @organisation = Organisation.find_by_id(params[:organisation_id]) || Organisation.all.first
    @organisations = Organisation.children_of(@organisation)
    respond_to do |format|
      format.html
    end
  end

  def membership_dataset
    @organisation = Organisation.find_by_id(params[:organisation_id])
    render text: generate_csv
  end

  private

    def generate_csv
      organisations = Organisation.subtree_of(@organisation)
      CSV.generate do |csv|
        csv << ["organisation", "membership_type", "year", "scout_type", "gender", "head_count"]
        organisations.each do |o|
          o.memberships.each do |m|
            csv << [o.name, m.membership_type.name, m.year.name, m.scout_type.name, m.gender, m.head_count.to_s]
          end
        end
      end
    end

end
