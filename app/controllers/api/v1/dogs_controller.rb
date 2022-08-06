class DogsController Api::V1::ApplicationController 
  def index
    dogs = Dog.all 
    if dogs
      render json: {status: "SUCCESS", data: dogs, message: "Dogs were loaded succesfully!"}, status: :ok
    else
      render json: dogs.errors, status: :bad_request
    end
  end
end