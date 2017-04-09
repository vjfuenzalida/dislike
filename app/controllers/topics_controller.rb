class TopicsController < ApplicationController
  before_action :get_topics, only: [:index]
  before_action :set_topic, only: [:show, :update, :edit, :destroy]

  def index
    @topic = Topic.find(params[:id])
  end

  def show
    @topic = Topic.find(params[:id])
    render :json => @topic.to_json

  end

  def new
  end

  def create
  end

  def edit
  end

  def update
    @descontento = Topic.find(params[:id])
    @descontento.votes += 1
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


end
