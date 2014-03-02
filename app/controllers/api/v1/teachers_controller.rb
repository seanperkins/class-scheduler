class Api::V1::TeachersController < Api::V1::ApiController

  #
  # Gets a list of student groups
  #
  # == Endpoint
  #
  # <code>GET /api/v1/teachers</code>
  #
  def index
    render json: {teachers: Teacher.order(:last_name).as_json}
  end

end