require 'rails_helper'

RSpec.describe 'MyGymモデルのテスト', type: :model do
  # 名前が空欄で登録できない→名前を空欄で登録したらfalse
  # バリデーションしていない状態で失敗→設定したら成功
  # 登録できるかできないか 登録できたら失敗
  # エラーメッセージがなければ失敗

  describe 'バリデーションのテスト' do
    let(:my_gym) { build(:my_gym) }
    subject { test_my_gym.valid? }
    context 'nameカラム' do
      let(:test_my_gym) { my_gym }
      it '空欄でないこと' do
        test_my_gym.name = ''
        is_expected.to eq false;
      end
      it '100文字以下であること' do
        test_my_gym.name = Faker::Lorem.characters(number:101)
        is_expected.to eq false;
      end
    end

  end
  describe 'アソシエーションのテスト' do
    context 'Customerモデルとの関係' do
      it 'N:1となっている' do
        expect(MyGym.reflect_on_association(:customer).macro).to eq :belong_to
      end
    end

  end
end
