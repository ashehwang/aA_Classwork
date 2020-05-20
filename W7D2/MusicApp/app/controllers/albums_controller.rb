class AlbumsController < ApplicationController

    def new
        @album = Album.new
        @bands = Band.all
        render :new
    end

    def show
        @album = Album.find(params[:id])
        render :show
    end

    def edit
        @album = Album.find(params[:id])
        render :edit
    end

    def update
        album = Album.find(params[:id])
        if album.update(album_params)
            redirect_to album_url(album)
        else
            render :edit
        end
    end

    def destroy
        album = Album.find(params[:id])
        if album.destroy
            redirect_to album_url(album)
        else
            redirect_to bands_url
        end
    end

    def create
        album = Album.new(album_params)
        if album.save
            redirect_to album_url(album.id)
        else
            flash.now[:errors] = ["Something's missing. Please try again."]
            render :new
        end
    end

    def album_params
        params.require(:album).permit(:title, :year, :band_id, :live)
    end

end