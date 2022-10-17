require 'rails_helper'

RSpec.describe "Albums", type: :request do
 
    describe "/albums/new"  do 

      it 'succeeds' do 
        get new_album_path
        expect(response).to have_http_status(:success)
      end

    end 

    describe "/albums/create" do 

      context "valid params" do 

          it "successfully creates album" do 

            expect do 
              post albums_path , params:{
                album: {
                name: 'life'
              }
            }
            end
            # expect(response).to have_http_status(:redirect_to)

          end
        end

    

      context "invalid params" do
        it "fail to  creates album" do 
          expect do 
            post albums_path , params:{ 
              album: {

                name: ''
              }
            }

          end
          # expect(response).to have_http_status(:success)
        end

      end
      
    end
    



end
