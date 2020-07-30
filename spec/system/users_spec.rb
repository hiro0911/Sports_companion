require 'rails_helper'

describe 'ユーザー認証のテスト' do
  describe 'ユーザー新規登録' do
    before do
      visit new_user_registration_path
    end
    context '新規登録画面に遷移' do
      it '新規登録に成功する' do
        fill_in 'user[name]', with: Faker::Internet.username(specifier: 5)
        fill_in 'user[email]', with: Faker::Internet.email
        fill_in 'user[password]', with: 'password'
        fill_in 'user[password_confirmation]', with: 'password'
        click_button '新規登録'

        expect(page).to have_content 'アカウント登録が完了しました。'
      end
      it '新規登録に失敗する' do
        fill_in 'user[name]', with: ''
        fill_in 'user[email]', with: ''
        fill_in 'user[password]', with: ''
        fill_in 'user[password_confirmation]', with: ''
        click_button '新規登録'

        expect(page).to have_content 'エラー'
      end
    end
  end
  describe 'ユーザーログイン' do
    let(:user) { create(:user) }
    before do
      visit new_user_session_path
    end
    context 'ログイン画面に遷移' do
      let(:test_user) { user }
      it 'ログインに成功する' do
        fill_in 'user[email]', with: test_user.email
        fill_in 'user[password]', with: test_user.password
        click_button 'ログイン'

        expect(page).to have_content 'ログインしました。'
      end

      it 'ログインに失敗する' do
        fill_in 'user[email]', with: ''
        fill_in 'user[password]', with: ''
        click_button 'ログイン'

        expect(current_path).to eq(new_user_session_path)
      end
    end
  end
end
describe "マイページのテスト" do
  context "表示の確認" do
    it "マイページと表示される"
      expect(page).to have_content("マイページ")
    it "ニックネームが表示される" do
    end
    it "メールアドレスが表示される" do
    end
    it "年齢が表示される" do
    end
    it "性別が表示される" do
    end
    it "自己紹介が表示される" do
    end
    it "いいねをもらった数が表示される" do
    end
    it "編集する ボタンが表示される" do
    end
    it "カレンダーを表示する ボタンが表示される" do
    end
    it "メッセージを見る ボタンが表示される" do
    end
    it "マイチームと表示される" do
    end
    it "マイチームが表示される" do
    end
    it
