require 'rails_helper'
describe 'お問い合わせのテスト' do
	let! (:user){create(:user)}
	before do
		visit new_user_session_path
		fill_in 'user[email]', with: user.email
		fill_in 'user[password]', with: user.password
		click_button 'ログイン'
	end
	describe 'お問い合わせページのテスト' do
		before do
			visit "/inquiry/new"
		end
		context '表示の確認' do
			it "タイトルが正しく表示される" do
				expect(page).to have_content "お問い合わせ"
			end
			it "名前の入力フォームが表示される" do
				expect(page).to have_field 'inquiry[name]'
			end
			it "メールアドレスの入力フォームが表示される" do
				expect(page).to have_field 'inquiry[email]'
			end
			it "お問い合わせ内容の入力フォームが表示される" do
				expect(page).to have_field 'inquiry[message]'
			end
			it "確認 ボタンが表示される" do
				expect(page).to have_button "確認"
			end
		end
		context 'お問い合わせ確認ページのテスト' do
			before do
				fill_in 'inquiry[name]', with: "テスト"
				fill_in 'inquiry[email]', with: "test@test"
				fill_in 'inquiry[message]', with: "テストメッセージ"
				click_on "確認"
			end
			it "タイトルが正しく表示される" do
				expect(page).to have_content "お問い合わせ"
			end
			it "名前が表示される" do
				expect(page).to have_content "テスト"
			end
			it "メールアドレスが表示される" do
				expect(page).to have_content "test@test"
			end
			it "お問い合わせ内容が表示される" do
				expect(page).to have_content "テストメッセージ"
			end
			it "送信 ボタンが表示される" do
				expect(page).to have_button "送信"
			end
	  end
	  context 'サンクスページのテスト' do
	  	before do
				fill_in 'inquiry[name]', with: "テスト"
				fill_in 'inquiry[email]', with: "test@test"
				fill_in 'inquiry[message]', with: "テストメッセージ"
				click_on "確認"
	  		click_on "送信"
	  	end
	  	it "タイトルが正しく表示される" do
	  		expect(page).to have_content "お問い合わせ"
	  	end
	  	it "テキストが正しく表示される" do
	  		expect(page).to have_content "お問い合わせいただきありがとうございました。"
	  	end
	  	it "トップに戻る ボタンが表示される" do
	  		expect(page).to have_link "トップに戻る", href: root_path
	  	end
	  end
	end
end