require "rails_helper"

RSpec.describe PlaylistsController, type: :controller do
  describe "Post #create" do
    it "create a new playlist" do

      expect {
        post :create, {playlist: attributes_for(:playlist)}
      }.to change(Playlist, :count).by(1)
    end

    it "assigns a newly created playlist as @playlist" do
      post :create, {playlist: attributes_for(:playlist)}

      expect(assigns(:playlist)).to be_a(Playlist)
      expect(assigns(:playlist)).to be_persisted
    end

    it "redirects to the created playlist" do
      post :create, {playlist: attributes_for(:playlist)}

      expect(response).to redirect_to(Playlist.last)
    end
  end

  context "with invalid params" do
    it "assigns a newly create playlist but unsave playlist as @playlist" do
      post :create, {playlist: attributes_for(:playlist, name: nil)}

      expect(assigns(:playlist)).to be_a_new(Playlist)
    end

    it "re-renders the new template" do
      post :create, {playlist: attributes_for(:playlist, name: nil)}

      expect(response).to render_template("new")
    end
  end

  describe "Put #update" do
    context "with valid params" do
      it "updates the given playlist" do

        playlist = create(:playlist)

        put :update, {id: playlist.to_param, playlist:attributes_for(:playlist, name: "Test Name")}
        playlist.reload

        expect(playlist.name).to eq("Test Name")
      end

      it "assign an updated playlist as @playlist" do
        playlist =  create(:playlist)

        put :update, {id: playlist.to_param, playlist: attributes_for(:playlist, name: "Test Name")}
        playlist.reload

        expect(playlist.name).to eq("Test Name")
        expect(assigns(:playlist)).to be_an_instance_of(Playlist)
        expect(assigns(:playlist)). to be_persisted
      end

      it "redirects to the create playlist" do

        playlist = create(:playlist)

        put :update, {id: playlist.to_param, playlist: attributes_for(:playlist, name: "Test Name")}
        playlist.reload

        expect(response).to redirect_to(Playlist.last)
      end
    end

      context "with invalid params" do
        it "assigns the playlist as @playlist" do

          playlist = create(:playlist)

          put :update, {id: playlist.to_param, playlist: attributes_for(:playlist, name: nil)}

          expect(assigns(:playlist)).to eq(playlist)
        end


        it "expects to re-render the edit template" do

          playlist = create(:playlist)

          put :update, {id: playlist.to_param, playlist: attributes_for(:playlist, name: nil)}

          expect(response).to render_template("edit")
        end
      end

  end

end
