module MissionControl::Jobs::JobsScoped
  extend ActiveSupport::Concern

  included do
    before_action :set_job, only: %i[ show ]
  end

  private
    def set_job
      @job = jobs_relation.find_by_id!(params[:id])
    end

    def jobs_relation
      raise NotImplementedError
    end
end