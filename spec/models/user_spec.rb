require 'spec_helper'

describe User do
  before do
  	@user = User.new(name: "Test User", email: "user@test.com",
                     password: "foobar", password_confirmation: "foobar")
  end

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:authenticate) }

  it {should be_valid }

  describe "when name doesn't exist" do
  	before { @user.name = "" }
  	it { should_not be_valid }
  end

  describe "when name is too long" do
  	before { @user.name = "b" * 51}
  	it { should_not be_valid }
  end

  describe "when email doesn't exist" do
  	before { @user.email = "" }
  	it { should_not be_valid }
  end

  describe "when email is a duplicate" do
  	before do
  		duplicate_user = @user.dup
  		duplicate_user.email = @user.email.upcase #uniqueness validation accounts for case, while emails shouldn't
  		duplicate_user.save
  	end

  	it {should_not be_valid}
  end

  describe "when email address is invalid" do
  	it "should be invalid" do
  		addresses = %w[foo@bar,com dumb.email@foo@bar.com dumb_at_foo.org.com]
  		addresses.each do |invalid|
  			@user.email = invalid
  			expect(@user).not_to be_valid
  		end
  	end
  end

  describe "when email address is valid" do
  	it "should be valid" do
  		addresses = %w[foo@bar.com dumb.email@foo.bar.com dumb_foo@fo.com]
  		addresses.each do |valid|
  			@user.email = valid
  			expect(@user).to be_valid
  		end
  	end
  end

  describe "when password isn't present" do
  	before do
  		@user = User.new(name: "Example User", email: "user@example.com",
                       password: " ", password_confirmation: " ")
  	end
  	it {should_not be_valid}
  end

  describe "when password doesn't match confirmation" do
  	before { @user.password_confirmation = "notfoobar" }
  	it {should_not be_valid}
  end

  describe "return value of authenticate" do
  	before { @user.save }
  	let(:found_user) {User.find_by_email(@user.email)}

  	describe "with valid password" do
  		it {should eq found_user.authenticate(@user.password)}
  	end

  	describe "with invalid password" do
  		let(:user_bad_password) {found_user.authenticate("notapassword")}

  		it { should_not eq user_bad_password}
  		specify { expect(user_bad_password).to be_false}
  	end
  end
end
