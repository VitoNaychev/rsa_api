require "RSA"

class DecryptController < ApplicationController
    protect_from_forgery with: :null_session

    def decrypt
        id = params[:id]
        message = params[:message]

        key = Key.find_by id: id.to_i

        if key == nil
            render plain: ""
            return
        end

        decr = RSA.new key.n, key.e, key.d
        decrypted = decr.decrypt message
        Decrypted.create(:message => decrypted)

        response = {"message" => decrypted}
        
        render json: response
    end
end
