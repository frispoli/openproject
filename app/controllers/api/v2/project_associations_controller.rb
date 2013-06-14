module Api
  module V2

    class ProjectAssociationsController < ProjectAssociationsController

      include ::Api::V2::ApiController

      def index
        respond_to do |format|
          format.api do
            @project_associations = @project.project_associations.visible
          end
        end
      end

      def available_projects
        available_projects = @project.associated_project_candidates
        respond_to do |format|
          format.api {
            @elements = Project.project_level_list(Project.visible)
            @disabled = Project.visible - available_projects
          }
        end
      end

      def show
        @project_association = @project.project_associations.find(params[:id])
        check_visibility

        respond_to do |format|
          format.api
        end
      end
    end

  end
end