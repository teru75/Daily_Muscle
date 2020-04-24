require 'rails_helper'

RSpec.describe 'customers', type: :system do
  describe 'ユーザー認証のテスト' do
    describe 'ユーザー新規登録' do
      before do
        visit new_customer_registration_path
      end
      context '新規登録画面に遷移' do
        it '新規登録に成功する' do
          fill_in 'customer[name]', with: Faker::Internet.customername(specifier: 5)
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
end