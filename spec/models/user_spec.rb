require 'spec_helper'

describe Book do
	before :each do
		@user = User.new "Jack", "jack@temp.com", :category
	end

	describe "#new" do
		it "takes three parameters and returns a User object" do
			@book.should be_an_instance_of Book
		end
	end
end