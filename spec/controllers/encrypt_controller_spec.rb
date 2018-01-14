require "rails_helper"
require "spec_helper"

RSpec.configure do |config|
    config.use_transactional_fixtures = false
end

id = 0

RSpec.describe CreateKeyController do
    it "generates key" do
        res = post :generate
        res = JSON.parse(res.body)
        id = res["id"].to_i
    end
end

RSpec.describe EncryptController do
    context "recieves a post request with a message" do
        it "adds the message to the database of encrypted" do
            old_count = Encrypted.count
            post :encrypt, params: {id: id, message: "message"}
            expect(Encrypted.count - old_count).to eq 1
        end
    end
    context "recieves a get request with a message ID" do
        it "returns the message from the encrypted database" do
            init_msg = "not a long message"
            res = post :encrypt, params: {id: id, message: init_msg}
            mess_id = JSON.parse(res.body)["id"].to_i

            get :get_message, params: {id: id, mess_id: mess_id}
            msg = JSON.parse(response.body)["message"]
            expect(msg.count(',')).to  eql (init_msg.length - 1)
        end
    end
    Encrypted.destroy_all
    Key.destroy_all
end
