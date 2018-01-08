require "RSA"

class CreateKeyController < ApplicationController
    protect_from_forgery with: :null_session

    def generate
        key_gen = RSA.new 0, 0, 0
        n_recv = params[:n]
        e_recv = params[:e]
        d_recv = params[:d]
        
        if n_recv == nil and e_recv == nil and d_recv == nil
            key = key_gen.new_key
            id = Key.create(:n => key[0], :e => key[1], :d => key[2]).id
        else
            id = Key.create(:n => n_recv, :e => e_recv, :d => d_recv).id
        end
       
        response = {"id" => id}
        
        render json: response
    end

    def get_key
        id = params[:id]
        key = Key.find_by id: id.to_i
        if key == nil
            render plain: ""
            return
        end
        
        response = {"n" => key.n, "e" => key.e, "d" => key.d}
        
        render json: response
    end

end
