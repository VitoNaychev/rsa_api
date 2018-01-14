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

RSpec.describe DecryptController do
    context "recieves a post request with a message" do
        it "adds the message to the database of decrypted" do
            old_count = Decrypted.count
            post :decrypt, params: {id: id, message: 269}
            expect(Decrypted.count - old_count).to eq 1
        end
    end
    Decrypted.destroy_all
    Key.destroy_all
end
