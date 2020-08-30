require 'rails_helper'

describe "チームのテスト" do
	let! (:sport){create(:sport)}
	let! (:prefecture){create(:prefecture)}
	let! (:team){create(:team, sport_id: sport.id,prefecture_id: prefecture.id)}
	let! (:team2){create(:team, sport_id: sport.id,prefecture_id: prefecture.id)}
	let! (:user){create(:user)}
	let! (:user2){create(:user)}
	let! (:team_comment_room){create(:team_comment_room,team_id: team.id)}
	let! (:team_comment_room2){create(:team_comment_room,team_id: team2.id)}
	let! (:team_comment){create(:team_comment, user_id: user.id, team_comment_room_id: team_comment_room.id)}
	let! (:team_comment2){create(:team_comment, user_id: user2.id, team_comment_room_id: team_comment_room2.id)}
	before do
		visit new_user_session_path
		fill_in 'user[email]', with: user.email
		fill_in 'user[password]', with: user.password
		click_button 'ログイン'
	end
	describe "チーム詳細のテスト（チーム未加入）" do
		before do
			visit "/teams/#{team.id}"
		end
		context '表示の確認' do
			it 'チーム加入申込み ボタンが表示される' do
				expect(page).to have_link "チーム加入申込み", href: new_team_applicant_path(team)
			end
		end
	end
	describe "新規チーム加入申請ページのテスト" do
		before do
			visit "/teams/#{team.id}/applicants/new"
		end
		context '表示の確認' do
			it  'タイトルが正しく表示される' do
				expect(page).to have_content "新規チーム加入申請"
			end
			it 'チーム画像が表示される' do
				expect(page).to have_css ('img.image')
			end
			it 'チーム名が表示される' do
				expect(page).to have_content team.team_name
			end
			it 'テキストが正しく表示される' do
				expect(page).to have_content "このチームに加入申請します"
				expect(page).to have_content "よろしいですか？"
			end
			it 'はい ボタンが表示される' do
				expect(page).to have_link "はい", href: "/teams/#{team.id}/applicants"
			end
			it 'いいえ ボタンが表示される' do
				expect(page).to have_link "いいえ", href: prefecture_sport_teams_path(team.prefecture_id, team.sport_id)
			end
		end
		context 'チーム加入申請のテスト' do
			it "加入申請に成功する" do
				click_on "はい"
				expect(page).to have_content "チーム加入申請しました。"
			end
		end
	end
	describe "新規チーム加入申請確定ページのテスト" do
		before do
			visit "/teams/#{team.id}/applicants/thanks"
		end
		context '表示の確認' do
			it "タイトルが正しく表示される" do
				expect(page).to have_content "新規チーム加入申請確定"
			end
			it "チームの画像が表示される" do
				expect(page).to have_css ('img.image')
			end
			it "チーム名が表示される" do
				expect(page).to have_content team.team_name
			end
			it "テキストが正しく表示される" do
				expect(page).to have_content "チームに加入申請しました！"
			end
			it "マイページに移動する ボタンが表示される" do
				expect(page).to have_link "マイページに移動する", href: user_path(user.id)
			end
			it "チーム詳細に戻る ボタンが表示される" do
				expect(page).to have_link "チーム詳細に戻る", href: team_path(team)
			end
		end
	end 
end