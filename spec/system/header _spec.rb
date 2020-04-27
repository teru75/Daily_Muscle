require 'rails_helper'

describe 'ヘッダーのテスト' do
  describe 'ユーザー,管理者がログインしていない場合' do
    before do
      visit root_path
    end

    context 'ヘッダーの表示を確認' do
      subject { page }

      it 'タイトルとリンクが表示される' do
        home_link = find_all('a')[0].native.inner_text
        expect(home_link).to match(/Daily Muscle/)
      end
      it '筋トレテンプレートリンクが表示される' do
        event_template_link = find_all('a')[1].native.inner_text
        expect(event_template_link).to match(/筋トレテンプレートを見る/)
      end
      it '新規登録リンクが表示される' do
        signup_link = find_all('a')[2].native.inner_text
        expect(signup_link).to match(/新規登録/)
      end
      it 'ログインリンクが表示される' do
        login_link = find_all('a')[3].native.inner_text
        expect(login_link).to match(/ログイン/)
      end
    end

    context 'ヘッダーのリンクを確認' do
      subject { current_path }

      it 'Top画面に遷移する' do
        home_link = find_all('a')[0].native.inner_text
        home_link = home_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
        home_link.gsub!(/\n/, '')
        click_link home_link
        is_expected.to eq(root_path)
      end
      it '筋トレテンプレート画面に遷移する' do
        event_templates_link = find_all('a')[1].native.inner_text
        event_templates_link = event_templates_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
        click_link event_templates_link
        is_expected.to eq(event_templates_path)
      end
      it '新規登録画面に遷移する' do
        signup_link = find_all('a')[2].native.inner_text
        signup_link = signup_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
        click_link signup_link
        is_expected.to eq(new_customer_registration_path)
      end
      it 'ログイン画面に遷移する' do
        login_link = find_all('a')[3].native.inner_text
        login_link = login_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
        click_link login_link
        is_expected.to eq(new_customer_session_path)
      end
    end
  end

  describe 'ユーザーがログインしている場合' do
    let(:customer) { create(:customer) }

    before do
      visit new_customer_session_path
      fill_in 'customer[email]', with: customer.email
      fill_in 'customer[password]', with: customer.password
      click_button 'ログイン'
    end

    context 'ヘッダーの表示を確認' do
      subject { page }

      it 'タイトルとリンクが表示される' do
        home_link = find_all('a')[0].native.inner_text
        expect(home_link).to match(/Daily Muscle/)
      end
      it 'マイページリンクが表示される' do
        event_link = find_all('a')[1].native.inner_text
        expect(event_link).to match(/マイページ/)
      end
      it '筋トレログ登録リンクが表示される' do
        event_link = find_all('a')[2].native.inner_text
        expect(event_link).to match(/筋トレログ登録/)
      end
      it 'タイムラインリンクが表示される' do
        events_link = find_all('a')[3].native.inner_text
        expect(events_link).to match(/タイムライン/)
      end
      it '筋トレテンプレートリンクが表示される' do
        templates_link = find_all('a')[4].native.inner_text
        expect(templates_link).to match(/筋トレテンプレート/)
      end
      it 'ログアウトリンクが表示される' do
        logout_link = find_all('a')[5].native.inner_text
        expect(logout_link).to match(/ログアウト/)
      end
    end

    context 'ヘッダーのリンクを確認' do
      subject { current_path }

      it 'トップ画面に遷移する' do
        home_link = find_all('a')[0].native.inner_text
        home_link = home_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
        click_link home_link
        is_expected.to eq('/')
      end
      it 'マイページ画面に遷移する' do
        home_link = find_all('a')[1].native.inner_text
        home_link = home_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
        click_link home_link
        is_expected.to eq('/customers/' + customer.id.to_s)
      end
      it 'トレーニング登録画面に遷移する' do
        event_link = find_all('a')[2].native.inner_text
        event_link = event_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
        click_link event_link
        is_expected.to eq('/events/new')
      end
      it 'タイムライン画面に遷移する' do
        events_link = find_all('a')[3].native.inner_text
        events_link = events_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
        click_link events_link
        is_expected.to eq('/events')
      end
      it '筋トレテンプレート一覧画面に遷移する' do
        event_templates_link = find_all('a')[4].native.inner_text
        event_templates_link = event_templates_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
        click_link event_templates_link
        is_expected.to eq('/event_templates')
      end
      it 'ログアウト する' do
        logout_link = find_all('a')[5].native.inner_text
        logout_link = logout_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
        click_link logout_link
        expect(page).to have_content 'ログアウトしました。'
      end
    end
  end

  describe '管理者がログインしている場合' do
    let(:admin) { create(:admin) }

    before do
      visit new_admin_session_path
      fill_in 'admin[email]', with: admin.email
      fill_in 'admin[password]', with: admin.password
      click_button 'ログイン'
    end

    context 'ヘッダーの表示を確認' do
      subject { page }

      it 'タイトルとリンクが表示される' do
        home_link = find_all('a')[0].native.inner_text
        expect(home_link).to match(/Daily Muscle/)
      end
      it 'トップリンクが表示される' do
        templates_link = find_all('a')[1].native.inner_text
        expect(templates_link).to match(/トップ/)
      end
      it 'テンプレート一覧リンクが表示される' do
        templates_link = find_all('a')[2].native.inner_text
        expect(templates_link).to match(/テンプレート一覧/)
      end
      it '会員トレーニング一覧リンクが表示される' do
        events_link = find_all('a')[3].native.inner_text
        expect(events_link).to match(/会員トレーニング一覧/)
      end
      it '会員一覧が表示される' do
        customers_link = find_all('a')[4].native.inner_text
        expect(customers_link).to match(/会員一覧/)
      end
      it 'ログアウトリンクが表示される' do
        logout_link = find_all('a')[5].native.inner_text
        expect(logout_link).to match(/ログアウト/)
      end
    end

    context 'ヘッダーのリンクを確認' do
      subject { current_path }

      it 'トップ画面に遷移する' do
        home_link = find_all('a')[0].native.inner_text
        home_link = home_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
        click_link home_link
        is_expected.to eq('/')
      end
      it '管理者ホーム画面に遷移する' do
        home_link = find_all('a')[1].native.inner_text
        home_link = home_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
        click_link home_link
        is_expected.to eq('/admin/homes/top')
      end
      it 'テンプレート一覧画面に遷移する' do
        templates_link = find_all('a')[2].native.inner_text
        templates_link = templates_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
        click_link templates_link
        is_expected.to eq('/admin/event_templates')
      end
      it '会員トレーニング一覧画面に遷移する' do
        events_link = find_all('a')[3].native.inner_text
        events_link = events_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
        click_link events_link
        is_expected.to eq('/admin/events')
      end
      it '会員一覧画面に遷移する' do
        customers_link = find_all('a')[4].native.inner_text
        customers_link = customers_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
        click_link customers_link
        is_expected.to eq('/admin/customers')
      end
      it 'ログアウト する' do
        logout_link = find_all('a')[5].native.inner_text
        logout_link = logout_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
        click_link logout_link
        expect(page).to have_content 'ログアウトしました。'
      end
    end
  end
end
