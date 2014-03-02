class Api::V1::StudentGroupsController < Api::V1::ApiController

  #
  # Gets a list of student groups
  #
  # == Endpoint
  #
  # <code>GET /api/v1/student_groups</code>
  #
  def index
    render json: {student_groups: StudentGroup.order(:grade).as_json}
  end

end