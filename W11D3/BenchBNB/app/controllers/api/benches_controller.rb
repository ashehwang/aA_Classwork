class API::BenchesController < ApplicationController
    before_action :require_login, only: [:create]

    def index
        @benches = Bench.all 
        render :index
    end

    def show
        @bench = Bench.find(params[:id])
    end

    def create
        @bench = Bench.new(bench_params)
        if @bench.save
            render :show
        else
            render json: @bench.errors.full_messages, status: 401
        end

    end

    def bench_params
        params.require(:bench).permit(:lat, :lng, :description, :picture_url)
    end
end
