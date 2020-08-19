require 'rails_helper'

describe "スポーツページのテスト" do
	let! (:sport){create(:sport)}
	let! (:prefecture){create(:prefecture)}
	let! (:team){create(:team, sport_id: sport.id,prefecture_id: prefecture.id)}
	let! (:user){create(:user)}
	let! (:room){create(:room, user_id: user.id)}
	let! (:applicant){create(:applicant, user_id: user.id, team_id: team.id)}
	let! (:team_member){create(:team_member,user_id: user.id, team_id: team.id)}
	before do
		visit new_user_session_path
		fill_in 'user[email]', with: user.email
		fill_in 'user[password]', with: user.password
		click_button 'ログイン'
	end
	describe "スポーツ一覧ページのテスト" do
		before do
			visit sports_path
		end
   	context '表示の確認' do
   		it 'タイトルが正しく表示される' do
   			expect(page).to have_content "スポーツを選択してください"
   		end
   		it 'スポーツジャンル追加 ボタンが表示される' do
   			expect(page).to have_link href: new_sport_path
   		end
   		it '編集 ボタンが表示される' do
   			expect(page).to have_link href: edit_sport_path(sport)
   		end
   		it '投稿画像が正しく表示される' do
   			expect(page).to have_css("img[src*='image']")
   		end
   		it '投稿スポーツ名が正しく表示される' do
   			expect(page).to have_content(sport.sport_genre)
   		end
   	end
  end
  describe 'スポーツジャンル追加ページのテスト' do
  	
  end
end