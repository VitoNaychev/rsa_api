require "RSA"

class EncryptController < ApplicationController
    protect_from_forgery with: :null_session

    def encrypt
        id = params[:id]
        message = params[:message]

        key = Key.find_by id: id.to_i

        if key == nil
            render plain: ""
            return
        end

        encr = RSA.new key.n, key.e, key.d
        encrypted = encr.encrypt message
        encr_id = Encrypted.create(:message => encrypted).id
        
        render plain: encr_id
    end

    def get_message
        id = params[:id]
        mess_id = params[:mess_id]

        encrypted = Encrypted.find_by id: mess_id
        if encrypted == nil 
            render plain: ""
            return
        end

        response = {"message" => encrypted.message}

        render json: response
    end
end
