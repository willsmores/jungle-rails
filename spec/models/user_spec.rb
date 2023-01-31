require 'rails_helper'

RSpec.describe User, type: :model do
  
  subject { 
    described_class.new(first_name: "Jim", last_name: "Morris", email: "jm@gmail.com", password: "password", password_confirmation: "password"
    )  
  }

  describe "Validations" do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end  
    
    it 'is created with password and password_confirmation values matching' do
      expect(subject.password).to eq(subject.password_confirmation)
    end

    it 'is invalid when the passwords do not match' do
      subject.password_confirmation = "wordpass"
      expect(subject).not_to be_valid
    end

    it "is not valid without a password" do
      subject.password = nil
      expect(subject).to be_invalid
    end

    it "is not valid without an email" do
      subject.email = nil
      expect(subject).to be_invalid
    end

    it "is not valid without a first name" do
      subject.first_name = nil
      expect(subject).to be_invalid
    end

    it "is not valid without a last name" do
      subject.last_name = nil
      expect(subject).to be_invalid
    end

    it "is not valid with a password under 6 chars" do
      subject.password = "test"
      subject.password_confirmation = "test"
      expect(subject).to be_invalid
    end

    it "is valid with a password over 6 chars" do
      subject.password = "testmypassword"
      subject.password_confirmation = "testmypassword"
      expect(subject).to be_valid
    end

    it "is invalid when the email address is not unique" do
      described_class.create!(first_name: "Jim", last_name: "Morris", email: "jm@gmail.com", password: "password", password_confirmation: "password")
      expect(subject).to be_invalid
    end

    it "is invalid when the email address is not unique (case sensitive)" do
      described_class.create!(first_name: "Jim", last_name: "Morris", email: "JM@gmail.com", password: "password", password_confirmation: "password")
      expect(subject).to be_invalid
    end

    it "is valid when the email address is unique" do
      described_class.create!(first_name: "Jim", last_name: "Morris", email: "jim@outlook.com", password: "password", password_confirmation: "password")
      expect(subject).to be_valid
    end

  end

  describe '.authenticate_with_credentials' do

    it "is valid when authenticated" do

      user = User.new(first_name: "Steve", last_name: "Willsmore", email: "sw@gmail.com", password: "password2", password_confirmation: "password2"
      )

      user.save

      login = user.authenticate_with_credentials("sw@gmail.com", "password2")

      expect(user.email).to eq(login.email)
    end

    it "returns nil when the user is not authenticated" do

      user = User.new(first_name: "Steve", last_name: "Willsmore", email: "sw@gmail.com", password: "password2", password_confirmation: "password2"
      )

      user.save

      login = user.authenticate_with_credentials("steve@outlook.com", "password2")

      expect(login).to be_nil
    end

    it "is valid when the email address has spaces before or after" do

      user = User.new(first_name: "Steve", last_name: "Willsmore", email: "sw@gmail.com", password: "password2", password_confirmation: "password2"
      )

      user.save

      login = user.authenticate_with_credentials("    sw@gmail.com  ", "password2")

      expect(user.email).to eq(login.email)
    end

    it "is valid when the email address is entered with the wrong case" do

      user = User.new(first_name: "Steve", last_name: "Willsmore", email: "sw@gmail.com", password: "password2", password_confirmation: "password2"
      )

      user.save

      login = user.authenticate_with_credentials("SW@gmail.CoM", "password2")

      expect(user.email).to eq(login.email)
    end

  end
end
