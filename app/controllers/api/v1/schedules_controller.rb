class Api::V1::SchedulesController < Api::V1::ApiController

  #
  # Gets a list of schedules
  #
  # == Endpoint
  #
  # <code>GET /api/v1/schedules</code>
  #
  def show
    render json: Schedule.find(params[:id]).as_json
  end

  #
  # Creates a new schedule
  #
  # == Endpoint
  #
  # <code>POST /api/v1/schedules</code>
  #

  def create
    @schedule = Schedule.create( name: 'New Schedule' )

    render json: @schedule.as_json
  end

  #
  # Updates a schedule with new blocks
  #
  # == Endpoint
  #
  # <code>PUT /api/v1/schedules/:id</code>
  #
  #   {
  #     "schedule": {
  #         "blocks": [
  #             {
  #                 "id": 1,
  #                 "start_time": 0,
  #                 "duration": 3,
  #                 "teacher_ids": [
  #                     1,
  #                     2,
  #                     3
  #                 ],
  #                 "student_group_ids": [
  #                     1,
  #                     2,
  #                     3
  #                 ]
  #             }
  #         ]
  #     }
  # }
  def update
    @schedule = Schedule.find(params[:id])

    # Strong params does not like blocks
    params[:schedule][:blocks_attributes] = params[:schedule].delete(:blocks)

    @schedule.update_attributes!( schedule_params )

    render json: @schedule.as_json(include: :blocks)
  end

  private

  def schedule_params
    params.require(:schedule).permit(
      :id,
      :name,
      :blocks_attributes=>[ :id,:start_time, :duration, :teacher_ids=>[],:student_group_ids=>[] ])
  end
end