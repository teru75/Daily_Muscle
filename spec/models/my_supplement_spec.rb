require 'rails_helper'

RSpec.describe 'MySupplementモデルのテスト', type: :model do
  # 名前が空欄で登録できない→名前を空欄で登録したらfalse
  # バリデーションしていない状態で失敗→設定したら成功
  # 登録できるかできないか 登録できたら失敗
  # エラーメッセージがなければ失敗

  describe 'バリデーションのテスト' do
    let(:customer) { create(:customer) }
    let!(:my_supplement) { build(:my_supplement, customer_id: customer.id) }

    context 'genreカラム' do
      it '空欄でないこと' do
        my_supplement.name = ''
        expect(my_supplement.valid?).to eq false
      end
    end

    context 'nameカラム' do
      it '空欄でないこと' do
        my_supplement.name = ''
        expect(my_supplement.valid?).to eq false
      end
      it '100文字以下であること' do
        my_supplement.name = Faker::Lorem.characters(number: 101)
        expect(my_supplement.valid?).to eq false
      end
    end

    context 'brandカラム' do
      it '空欄でないこと' do
        my_supplement.name = ''
        expect(my_supplement.valid?).to eq false
      end
      it '100文字以下であること' do
        my_supplement.brand = Faker::Lorem.characters(number: 101)
        expect(my_supplement.valid?).to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Customerモデルとの関係' do
      it 'N:1となっている' do
        expect(MySupplement.reflect_on_association(:customer).macro).to eq :belongs_to
      end
    end
  end
end
