require 'rails_helper'

RSpec.describe 'Eventモデルのテスト', type: :model do
  # 名前が空欄で登録できない→名前を空欄で登録したらfalse
  # バリデーションしていない状態で失敗→設定したら成功
  # 登録できるかできないか 登録できたら失敗
  # エラーメッセージがなければ失敗

  describe 'バリデーションのテスト' do
    let(:event) { build(:event) }
    subject { test_event.valid? }
    context 'partカラム' do
      let(:test_event) { event }
      it '空欄でないこと' do
        test_event.part = ''
        is_expected.to eq false;
      end
      it '2文字以上であること' do
        test_event.part = Faker::Lorem.characters(number:1)
        is_expected.to eq false;
      end
      it '50文字以下であること' do
        test_event.part = Faker::Lorem.characters(number:51)
        is_expected.to eq false;
      end
    end

    context 'startカラム ' do
      let(:test_event) { event }
      it '空欄でないこと' do
        test_event.start = ''
        is_expected.to eq false;
      end
    end

    context 'endカラム ' do
      let(:test_event) { event }
      it '空欄でないこと 'do
        test_event.end = ''
        is_expected.eq false;
      end
    end
  end
  describe 'アソシエーションのテスト' do
    context 'Menuモデルとの関係' do
      it '1:Nとなっている' do
        expect(Event.reflect_on_association(:menus).macro).to eq :has_many
      end
    end

    context 'Customerモデルとの関係' do
      it 'N:1となっている' do
        expect(Event.reflect_on_association(:customer).macro).to eq :belongs_to
      end
    end

    context 'EventLikeモデルとの関係' do
      it '1:Nとなっている' do
        expect(Event.reflect_on_association(:event_likes).macro).to eq :has_many
      end
    end

  end
end
