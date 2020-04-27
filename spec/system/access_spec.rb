require 'rails_helper'

RSpec.describe 'Access', type: :system do
  describe 'ユーザー権限のテスト'  do
    let!(:customer) { create(:customer) }
    let!(:customer2) { create(:customer) }
    let!(:event) { create(:event, customer: customer) }
    let!(:my_menu) { create(:my_menu, customer: customer) }
    let!(:my_menu_item) { create(:my_menu_item, customer: customer, my_menu: my_menu) }
    let!(:my_gym) { create(:my_gym, customer: customer) }
    let!(:my_supplement) { create(:my_supplement, customer: customer) }
    let!(:event_template) { create(:event_template) }
    let!(:menu_template) { create(:menu_template, event_template: event_template) }

    describe 'ログインしていない場合' do
      context '筋トレログ投稿関連のURLにアクセス' do
        it '作成画面に遷移できない' do
          visit new_event_path
          expect(current_path).to eq('/customers/sign_in')
        end
        it 'タイムラインに遷移できない' do
          visit events_path
          expect(current_path).to eq('/customers/sign_in')
        end
        it '投稿詳細画面に遷移できない' do
          visit event_path(event.id)
          expect(current_path).to eq('/customers/sign_in')
        end
      end

      context 'マイメニュー関連のURLにアクセス' do
        it '作成画面に遷移できない' do
          visit new_customer_my_menu_path(customer.id)
          expect(current_path).to eq('/customers/sign_in')
        end
        it '一覧画面に遷移できない' do
          visit customer_my_menus_path(customer.id)
          expect(current_path).to eq('/customers/sign_in')
        end
      end

      context 'マイジム関連のURLにアクセス' do
        it '作成画面に遷移できない' do
          visit new_customer_my_gym_path(customer.id)
          expect(current_path).to eq('/customers/sign_in')
        end
        it '一覧画面に遷移できない' do
          visit customer_my_gyms_path(customer.id)
          expect(current_path).to eq('/customers/sign_in')
        end
      end

      context 'マイサプリメント関連のURLにアクセス' do
        it '作成画面に遷移できない' do
          visit new_customer_my_supplement_path(customer.id)
          expect(current_path).to eq('/customers/sign_in')
        end
        it '一覧画面に遷移できない' do
          visit customer_my_supplements_path(customer.id)
          expect(current_path).to eq('/customers/sign_in')
        end
        it '投稿詳細画面に遷移できない' do
          visit customer_my_supplement_path(my_supplement.customer_id, my_supplement.id)
          expect(current_path).to eq('/customers/sign_in')
        end
      end

      context 'フォロー関連のURLにアクセス' do
        it 'フォロー一覧画面に遷移できない' do
          visit customer_follows_path(customer.id)
          expect(current_path).to eq('/customers/sign_in')
        end
        it 'フォロワー一覧画面に遷移できない' do
          visit customer_followers_path(customer.id)
          expect(current_path).to eq('/customers/sign_in')
        end
      end

      context 'データ関連のURLにアクセス' do
        it '一覧画面に遷移できない' do
          visit customer_datas_path(customer.id)
          expect(current_path).to eq('/customers/sign_in')
        end
      end

      context 'ユーザー関連のURLにアクセス' do
        it '編集画面に遷移できない' do
          visit edit_customer_path(customer.id)
          expect(current_path).to eq('/customers/sign_in')
        end
        it '詳細画面に遷移できない' do
          visit customer_path(customer.id)
          expect(current_path).to eq('/customers/sign_in')
        end
      end
    end

    describe 'ログインしている場合' do
      before do
        visit new_customer_session_path
        fill_in 'customer[email]', with: customer.email
        fill_in 'customer[password]', with: customer.password
        click_button 'ログイン'
      end

      context 'データ関連のURLにアクセス' do
        it '一覧画面に遷移できない' do
          visit customer_datas_path(customer2.id)
          expect(current_path).to eq('/customers/' + customer2.id.to_s)
        end
      end

      context 'ユーザー関連のURLにアクセス' do
        it '編集画面に遷移できない' do
          visit edit_customer_path(customer2.id)
          expect(current_path).to eq('/customers/' + customer.id.to_s)
        end
      end
    end
  end

  describe '管理者権限のテスト' do
    let!(:admin) { create(:admin) }
    let!(:customer) { create(:customer) }
    let!(:event) { create(:event, customer: customer) }
    let!(:event_template) { create(:event_template) }
    let!(:menu_template) { create(:menu_template, event_template: event_template) }

    describe 'ログインしていない場合にユーザー関連のURLにアクセス' do
      context '筋トレテンプレート関連のURLにアクセス' do
        it '一覧画面に遷移できない' do
          visit admin_event_templates_path
          expect(current_path).to eq('/admins/sign_in')
        end
        it '登録画面に遷移できない' do
          visit new_admin_event_template_path
          expect(current_path).to eq('/admins/sign_in')
        end
        it '詳細画面に遷移できない' do
          visit admin_event_template_path(event_template.id)
          expect(current_path).to eq('/admins/sign_in')
        end
      end

      context 'ユーザー関連のURLにアクセス' do
        it '一覧画面に遷移できない' do
          visit admin_customers_path
          expect(current_path).to eq('/admins/sign_in')
        end
        it '詳細画面に遷移できない' do
          visit admin_customer_path(customer.id)
          expect(current_path).to eq('/admins/sign_in')
        end
      end

      context '筋トレログ関連のURLにアクセス' do
        it '一覧画面に遷移できない' do
          visit admin_events_path
          expect(current_path).to eq('/admins/sign_in')
        end
        it '詳細画面に遷移できない' do
          visit admin_event_path(event.id)
          expect(current_path).to eq('/admins/sign_in')
        end
      end
    end
  end
end
