Given /^a valid user$/ do
  @user=User.create!({
      :name =>"jhantoo",
      :email =>"jhantoo@circarconsulting.com",
      :password =>"abc123",
      :password_confirmation =>"abc123",
    })
end


Given /^a logged in user$/ do
  Given 'a valid user'
  visit new_user_session_path
  fill_in "Email" , :with =>"jhantoo@circarconsulting.com"
  fill_in "Password" , :with =>"abc123"
  click_button "Sign in"
end