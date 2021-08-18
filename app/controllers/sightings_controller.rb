class SightingsController < ApplicationController

    def index
        sightings = Sighting.all
        render json: sightings, include: [:bird, :location]
    end

    def show
        sighting = Sighting.find_by(id: params[:id])
        #notice we did the above code differently // but have to write it this way for error at end to work
        if sighting
        render json: sighting, include: [:bird, :location], except: [:updated_at]
        else 
        render json: { message: "No sighting found with that id" }
        end 
    end

end
