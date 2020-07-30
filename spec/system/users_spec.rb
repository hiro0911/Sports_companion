require 'rails_helper'

describe 'ユーザーのテスト' do
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
  describe "マイページのテスト" do
    let(:user) { create(:user) }
    before do
      visit new_user_session_path
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_button 'ログイン'
      visit user_path(user)
    end
    context "表示の確認" do
      before do
        visit user_path(user)
      end
      it "マイページと表示される" do
        expect(page).to have_content("マイページ")
      end
      it "ニックネームが表示される" do
        expect(page).to have_content(user.name) 
      end
      it "メールアドレスが表示される" do
        expect(page).to have_content(user.email)
      end
      it "年齢が表示される" do
        expect(page).to have_content(user.age)
      end
      it "性別が表示される" do
        expect(page).to have_content(user.sex)
      end
      it "自己紹介が表示される" do
        expect(page).to have_content(user.introduction)
      end
      it "いいねをもらった数が表示される" do
        expect(page).to have_content(user.likes.count)
      end
      it "編集する ボタンが表示される" do
        expect(page).to have_content "編集する"
      end
      it "カレンダーを表示する ボタンが表示される" do
        expect(page).to have_content "カレンダーを表示する"
      end
      it "メッセージを見る ボタンが表示される" do
        expect(page).to have_content "メッセージを見る"
      end
    end
    context "マイチームの表示確認" do
      before do
        visit user_path(user)
      end
      it "マイチームと表示される" do
        expect(page).to have_content "マイチーム"
      end
      it "マイチームが表示される" do
      end
      it "チーム詳細ページ ボタンが表示される" do
      end
      it "チームを退会する ボタンが表示される" do
      end
      it "加入申請中のチームと表示される" do 
      end
      it "加入申請中のチームが表示される" do
      end
      it "チーム詳細ページ ボタンが表示される" do
      end
      it "チーム加入取り消し ボタンが表示される" do
      end
    end
    context "リンク先の確認" do
      it "編集する ボタンのリンク先が正しいか" do
      end
      it "カレンダーを表示する ボタンのリンク先が正しいか" do
      end
      it "メッセージを見る ボタンのリンク先が正しいか" do
      end
      it "マイチーム チーム詳細ページ ボタンのリンク先が正しいか" do
      end
      it "マイチーム チームを退会する チーム退会できるか" do
      end
      it "加入申請中のチーム チーム詳細 ボタンのリンク先が正しいか" do
      end
      it "加入申請中のチーム チーム加入取り消し チーム加入申請取り消しできるか" do
      end
    end
  end
end