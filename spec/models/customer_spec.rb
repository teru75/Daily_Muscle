require 'rails_helper'

RSpec.describe 'Customerモデルのテスト', type: :model do
  # 名前が空欄で登録できない→名前を空欄で登録したらfalse
  # バリデーションしていない状態で失敗→設定したら成功
  # 登録できるかできないか 登録できたら失敗
  # エラーメッセージがなければ失敗

  describe 'バリデーションのテスト' do
    subject { test_customer.valid? }

    let(:customer) { build(:customer) }

    context 'nameカラム ' do
      let(:test_customer) { customer }

      it '空欄でないこと' do
        test_customer.name = ''
        is_expected.to eq false
      end
      it '50文字以下であること' do
        test_customer.name = Faker::Lorem.characters(number: 51)
        is_expected.to eq false
      end
    end

    context 'emailカラム ' do
      let(:test_customer) { customer }

      it '空欄でないこと' do
        test_customer.email = ''
        is_expected.to eq false
      end
    end

    context 'passwordカラム' do
      let(:test_customer) { customer }

      it '空欄でないこと ' do
        test_customer.password = ''
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Eventモデルとの関係' do
      it '1:Nとなっている' do
        expect(Customer.reflect_on_association(:events).macro).to eq :has_many
      end
    end

    context 'MyMenuモデルとの関係' do
      it '1:Nとなっている' do
        expect(Customer.reflect_on_association(:my_menus).macro).to eq :has_many
      end
    end

    context 'MySupplementモデルとの関係' do
      it '1:Nとなっている' do
        expect(Customer.reflect_on_association(:my_supplements).macro).to eq :has_many
      end
    end

    context 'MyGymモデルとの関係' do
      it '1:Nとなっている' do
        expect(Customer.reflect_on_association(:my_gyms).macro).to eq :has_many
      end
    end

    context 'Eventモデルとの関係' do
      it '1:Nとなっている' do
        expect(Customer.reflect_on_association(:events).macro).to eq :has_many
      end
    end

    context 'EventLikeモデルとの関係' do
      it '1:Nとなっている' do
        expect(Customer.reflect_on_association(:event_likes).macro).to eq :has_many
      end
    end
  end
end
