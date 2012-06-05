module UserAuthHelper
	def sign_in
		@user = FactoryGirl.create(:user)
	  fill_in "user_email", :with => @user.email
	  fill_in "user_password", :with => @user.password
	  click_button "Sign in"
	  page.should have_content "success"
	end
end  
World(UserAuthHelper)