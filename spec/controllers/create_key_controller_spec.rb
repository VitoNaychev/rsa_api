require "rails_helper"
require "spec_helper"

RSpec.describe CreateKeyController do
    context "recieves a post request with no parameters" do
        it "adds a new key" do
            old_count = Key.count
            post :generate
            expect(Key.count  - old_count). to eq 1
        end
    end
    context "recieves a post request with custom keys" do
        it "adds the custom keys" do
            old_count = Key.count
            post :generate, params: {n: 5, e: 7, d: 3}
            expect(Key.count  - old_count). to eq 1
        end
    end
    context "recieves a get request with key ID" do
        it "returns a JSON with the key" do
            keys = {:n => 5, :e => 7, :d => 3}
            res = post :generate, params: {n: 5, e: 7, d: 3}
            keys = keys.to_json
            id = JSON.parse(res.body)
            get :get_key, params: {id: id["id"]}
            expect(response.body).to eq keys
        end
    end
end
