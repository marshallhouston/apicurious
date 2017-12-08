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

    context "#user_starred_repos" do
      it "returns repositories starred by the user" do
        VCR.use_cassette("GithubService#user_starred_repos") do

          starred_repos = subject.user_starred_repos
          starred_repo = starred_repos.first

          expect(starred_repos).to be_a Array
          expect(starred_repos.count).to eq 6
          expect(starred_repo).to be_a Hash
          expect(starred_repo[:name]).to eq "rales-engine"
        end
      end
    end

    context "#user_repos" do
      it "returns all repositories for the user" do
        VCR.use_cassette("GithubService#user_repos") do

          repos = subject.user_repos
          repo = repos.first

          expect(repos).to be_a Array
          expect(repos.count).to eq 42
          expect(repo).to be_a Hash
          expect(repo[:name]).to eq "activerecord_exploration"
          expect(repo[:language]).to eq "Ruby"
        end
      end
    end

    context "#followers" do
      it "returns all followers for the user" do
        VCR.use_cassette("GithubService#followers") do

          followers = subject.followers
          follower = followers.first

          expect(followers).to be_a Array
          expect(followers.count).to eq 3
          expect(follower).to be_a Hash
          expect(follower[:login]).to eq "PlanetEfficacy"
        end
      end
    end

    context "#following" do
      it "returns all people the user follow" do
        VCR.use_cassette("GithubService#following") do

          following = subject.following
          followed_person = following.first

          expect(following).to be_a Array
          expect(following.count).to eq 6
          expect(followed_person).to be_a Hash
          expect(followed_person[:login]).to eq "PlanetEfficacy"
        end
      end
    end

  end
end
