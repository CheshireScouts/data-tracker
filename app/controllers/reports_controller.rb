class ReportsController < ApplicationController
  load_and_authorize_resource

  def awards
    initialise_report
  end

  def membership
    initialise_report
  end

  def membership_dataset
    @organisation = Organisation.find_by_id(params[:organisation_id])
    render text: generate_membership_csv
  end

  def awards_dataset
    @organisation = Organisation.find_by_id(params[:organisation_id])
    render text: generate_awards_csv
  end

  private

    def initialise_report
      @organisation = Organisation.find_by_id(params[:organisation_id]) || Organisation.all.first
      @organisations = Organisation.children_of(@organisation)
      respond_to do |format|
        format.html
      end
    end

    def generate_membership_csv
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

    def generate_awards_csv
     organisations = Organisation.subtree_of(@organisation)
      CSV.generate do |csv|
        csv << ["organisation", "year", "award_type", "award_count"]
        organisations.each do |o|
          o.awards.each do |a|
            csv << [o.name, a.year.name, a.award_type.name, a.award_count.to_s]
          end
        end
      end
    end

end
