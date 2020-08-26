require 'rails_helper'

describe "チームのテスト" do
	let! (:sport){create(:sport)}
	let! (:prefecture){create(:prefecture)}
	let! (:team){create(:team, sport_id: sport.id,prefecture_id: prefecture.id)}
	let! (:user){create(:user)}
	let! (:applicant){create(:applicant, user_id: user.id, team_id: team.id)}
	let! (:team_member){create(:team_member,user_id: user.id, team_id: team.id)}
	before do
		visit new_user_session_path
		fill_in 'user[email]', with: user.email
		fill_in 'user[password]', with: user.password
		click_button 'ログイン'
	end
	describe 'チームメンバー募集一覧ページのテスト' do
		before do
			visit "/prefectures/#{prefecture.id}/sports/#{sport.id}/teams"
		end
		context '表示の確認' do
			it '選択した都道府県名が表示される' do
				expect(page).to have_content prefecture.content
			end
			it '選択したスポーツ名が表示される' do
				expect(page).to have_content sport.sport_genre
			end
			it 'タイトルが正しく表示される' do
				expect(page).to have_content "チームメンバー募集一覧"
			end
			it '新規チーム作成 ボタンが表示される' do
				expect(page).to have_link href: "/prefectures/#{prefecture.id}/sports/#{sport.id}/teams/new" 
			end
			it 'チームの画像が表示される' do
				expect(page).to have_css('img.image')
			end
			it 'チーム名が表示される' do
				expect(page).to have_content team.team_name
			end
			it '活動地域が表示される' do
				expect(page).to have_content team.area
			end
			it '募集人数が表示される' do
				expect(page).to have_content team.applicant
			end
			it '活動スタンスが表示される' do
				expect(page).to have_content team.stance
			end
		end
	end
	describe 'チーム新規作成ページのテスト' do
		context '表示の確認' do			
		end
	end
end