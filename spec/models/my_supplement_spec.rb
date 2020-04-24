require 'rails_helper'

RSpec.describe 'MySupplementモデルのテスト', type: :model do
  # 名前が空欄で登録できない→名前を空欄で登録したらfalse
  # バリデーションしていない状態で失敗→設定したら成功
  # 登録できるかできないか 登録できたら失敗
  # エラーメッセージがなければ失敗

  describe 'バリデーションのテスト' do
    let(:my_supplement) { build(:my_supplement) }
    subject { test_my_supplement.valid? }
    context 'genreカラム' do
      let(:test_my_supplement) {my_supplement}
      it '空欄でないこと' do
        test_my_supplement.genre = ''
        is_expected.to eq false;
      end
    end

    context 'nameカラム' do
      let(:test_my_supplement) { my_supplement }
      it '空欄でないこと' do
        test_my_supplement.name = ''
        is_expected.to eq false;
      end
      it '100文字以下であること' do
        test_my_supplement.name = Faker::Lorem.characters(number:101)
        is_expected.to eq false;
      end
    end

    context 'brandカラム' do
      let(:test_my_supplement) { my_supplement }
      it '空欄でないこと' do
        test_my_supplement.brand = ''
        is_expected.to eq false;
      end
      it '100文字以下であること' do
        test_my_supplement.brand = Faker::Lorem.characters(number:101)
        is_expected.to eq false;
      end
    end

  end
  describe 'アソシエーションのテスト' do
    context 'Customerモデルとの関係' do
      it 'N:1となっている' do
        expect(MySupplement.reflect_on_association(:customer).macro).to eq :belong_to
      end
    end

  end
end
