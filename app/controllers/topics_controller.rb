class TopicsController < ApplicationController
  before_action :get_topics, only: [:show, :display]
  before_action :set_topic, only: [:show, :update, :edit, :destroy]

  def index
    @topic = Topic.find(params[:id])
  end

  def display
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
    render :json => @topic.to_json
  end

  def new
    @topics = Topic.all
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.save
    @topics = Topic.all
    render new_topic_path
  end

  def edit
    @users = User.all
  end

  def update
    @descontento = Topic.find(params[:id])
    @descontento.points += 1
    @descontento.save
  end

  def destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def get_topics
      @topics = Topic.all
    end

    def set_topic
      @topic = Topic.find(params[:id])
    end

    def topic_params
      params.require(:topic).permit(:name, :description, :points, :user_id, :lat, :lon)
    end

end
