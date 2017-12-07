require 'rails_helper'

describe GithubService do
  let :user { create :user }
  subject { GithubService.new(user) }

  context "initialize" do
    it "initializes with a valid user" do
      expect(subject).to be_a GithubService
    end
  end

  context "instance methods" do
    context "#user_profile" do
      it "returns user information" do
        VCR.use_cassette("GithubService#user_profile") do
          profile_info = subject.user_profile

          expect(profile_info).to be_a Hash
          expect(profile_info[:login]).to eq("marshallhouston")
        end
      end
    end
  end
end


# describe PropublicaService do
#   subject { PropublicaService.new }
#
#   context "initialize" do
#     it "returns an instance" do
#       expect(subject).to be_a PropublicaService
#     end
#   end
#
#   context "instance methods" do
#     context "#members_by_state(state_abbr)" do
#       it "returns a list of all members as json" do
#         VCR.use_cassette("PropublicaService#members_by_state") do
#
#           members = subject.members_by_state("CO")
#           member = members.first
#
#           expect(members.count).to eq 7
#           expect(member).to be_a Hash
#         end
#       end
#     end
#   end
# end
