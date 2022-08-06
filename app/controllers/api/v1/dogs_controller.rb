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

  def destroy
    dog = Dog.find(params[:id])
    if dog.destroy!
      render json: {message: "Dog was deleted succesfully"}, status: :ok
    else
      render json: {message: "Dog does not exist"}, status: :bad_request
    end
  end

  def update
    dog = Dog.find(params[:id])
    if dog.update!(dog_params)
      render json: {message: "Dog was updated succesfully!", data: dog}, status: :ok
    else
      render json: {message: "Dog cannot be updated!"}, status: :unprocessable_entity
    end
  end

  private 

  def dog_params 
    params.require(:dog).permit(:name, :breed, :age)
  end
end

# module Api
#   module V1
#     class DogsController < ApplicationController
#     end
#   end
# end