require 'rails_helper'

RSpec.describe 'customers', type: :system do
  describe 'ユーザー認証のテスト' do
    describe 'ユーザー新規登録' do
      before do
        visit new_customer_registration_path
      end
      context '新規登録画面に遷移' do
        it '新規登録に成功する' do
          fill_in 'customer[name]', with: Faker::Internet.username(specifier: 5)
          fill_in 'customer[email]', with: Faker::Internet.email
          fill_in 'customer[password]', with: 'password'
          fill_in 'customer[password_confirmation]', with: 'password'
          click_button 'アカウント作成'
        end
        it '新規登録に失敗する' do
          fill_in 'customer[name]', with: ''
          fill_in 'customer[email]', with: ''
          fill_in 'customer[password]', with: ''
          fill_in 'customer[password_confirmation]', with: ''
          click_button 'アカウント作成'
        end
      end
    end
    describe 'ユーザーログイン' do
      let(:customer) { create(:customer) }
      before do
        customer
        visit new_customer_session_path
      end
      context 'ログイン画面に遷移' do
        it 'ログインに成功する' do
          fill_in 'customer[email]', with: customer.email
          fill_in 'customer[password]', with: customer.password
          click_button 'ログイン'
          # login_as customer, scope: customer
        end
        it 'ログインに失敗する' do
          fill_in 'customer[email]', with: ''
          fill_in 'customer[password]', with: ''
          click_button 'ログイン'
          expect(current_path).to eq(new_customer_session_path)
        end
      end
    end
  end

  describe 'ユーザーのテスト' do
    let(:customer) { create(:customer) }
    let!(:test_customer2) { create(:customer) }
    let!(:event) { create(:event, customer: customer) }
    let!(:menu) { create(:menu, event: event) }
    let!(:rep) { create(:rep, menu: menu) }
    before do
      visit new_customer_session_path
      fill_in 'customer[email]', with: customer.email
      fill_in 'customer[password]', with: customer.password
      click_button 'ログイン'
    end
   
    describe '編集のテスト' do
      context '自分の編集画面への遷移' do
        it '遷移できる' do
          visit edit_customer_path(customer)
          expect(current_path).to eq('/customers/' + customer.id.to_s + '/edit')
        end
      end
      context '他人の編集画面への遷移' do
        it '遷移できない' do
          visit edit_customer_path(test_customer2)
          expect(current_path).to eq('/customers/' + customer.id.to_s)
        end
      end

      context '編集作業' do
        before do
          visit edit_customer_path(customer)
        end
        it '編集に成功する' do
          click_button '編集内容を保存する'
          expect(page).to have_content 'ユーザー情報を編集しました。'
          expect(current_path).to eq('/customers/' + customer.id.to_s)
        end
        it '編集に失敗する' do
          fill_in 'customer[name]', with: ''
          click_button '編集内容を保存する'
          expect(page).to have_content '空欄または不正な値があります。'
          #もう少し詳細にエラー文出したい
          expect(current_path).to eq('/customers/' + customer.id.to_s)
        end
      end
    end

  end

end