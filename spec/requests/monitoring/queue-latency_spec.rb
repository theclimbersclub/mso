require "rails_helper"
RSpec.describe "Sidekiq Queue Latency" do
  it "is available to external moinitors" do
    get "/monitoring/queue-latency"
    expect(response).to have_http_status(:success)
    expect(response.body).to eq("OK")
  end
  it "returns ok when low latency" do
    queue = double("Sidekiq::Queue", latency: 10)
    allow(Sidekiq::Queue).to receive(:new) { queue }
    get "/monitoring/queue-latency"
    expect(response.body).to eq("OK")
  end

  it "returns uhoh when high latency" do
    queue = double("Sidekiq::Queue", latency: 31)
    allow(Sidekiq::Queue).to receive(:new) { queue }
    get "/monitoring/queue-latency"
    expect(response.body).to eq("UHOH")
  end
end
