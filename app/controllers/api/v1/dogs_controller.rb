class DogsController Api::V1::ApplicationController 
  def index
    dogs = Dog.all 
    if dogs
      render json: {status: "SUCCESS", data: dogs, message: "Dogs were loaded succesfully!"}, status: :ok
    else
      render json: dogs.errors, status: :bad_request
    end
  end

  def show 
    dog = Dog.find(params[:id])
    if dog
      render json: {data: dog}, status: :ok
    else
      render json: {message: "Dog cannot be found!"}, status: :bad_request
    end
  end

  def create
    dog = Dog.new(dog_params)
    if dog.save 
      render json: {status: "SUCCESS", data: dog, message: "Dog created!"}, status: :created
    else 
      render json: dog.errors, status: :unprocessable_entity
    end
  end
end