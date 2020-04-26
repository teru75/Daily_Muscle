require 'rails_helper'

RSpec.describe 'Events', type: :system do
  describe 'トレーニング投稿機能の確認' do
    let(:customer) { create(:customer) }
    let!(:event) { create(:event, customer: customer) }
    let!(:menu) { create(:menu, event: event) }
    let!(:rep) { create(:rep, menu: menu) }
    before do
      visit new_customer_session_path
      fill_in 'customer[email]', with: customer.email
      fill_in 'customer[password]', with: customer.password
      click_button 'ログイン'
    end
    describe '投稿フォームと投稿詳細ページ' do
      context '投稿ページへの遷移' do
        it '遷移できる' do
          visit new_event_path
          expect(current_path).to eq '/events/new'
        end
      end
      context "投稿機能の確認" do
        before do
          visit new_event_path
        end
        it '投稿に失敗する' do
          click_button '登録'
          expect(current_path).to eq '/events'
        end
      end
    end
  end
end