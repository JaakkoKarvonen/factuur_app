require 'spec_helper'

describe "Authentication" do

  subject { page }

  describe "signin" do
    before { visit signin_path }

    it { should have_content('Inloggen') }
    it { should have_title('Inloggen') }

    describe "with invalid information" do
      before { click_button "Inloggen" }

      it { should have_title('Inloggen') }
      it { should have_selector('div.alert.alert-error') }

      describe "after visiting another page" do
        before { click_link "Home" }
        it { should_not have_selector('div.alert.alert-error') }
      end
    end

    describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        fill_in "E-mail",    with: user.email.upcase
        fill_in "Wachtwoord", with: user.password
        click_button "Inloggen"
      end

      it { should have_title(user.name) }
      it { should have_link('Profile',     href: user_path(user)) }
      it { should have_link('Sign out',    href: signout_path) }
      it { should_not have_link('Sign in', href: signin_path) }
    end
  end
end
