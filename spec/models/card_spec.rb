require 'rails_helper'

RSpec.describe Card, type: :model do
  before do
    @card = FactoryBot.build(:card)
  end

  describe '新規カード情報登録' do
    context 'カード登録できるとき' do
      it '全ての項目が存在すれば登録できる' do
        expect(@card).to be_valid
      end
    end

    context 'カード登録できないとき' do
      it 'card_tokenが空では登録できない' do
        @card.card_token = nil
        @card.valid?
        expect(@card.errors.full_messages).to include("Card token can't be blank")
      end
      it 'customer_tokenが空では登録できない' do
        @card.customer_token = nil
        @card.valid?
        expect(@card.errors.full_messages).to include("Customer token can't be blank")
      end
      it 'カードに紐づくユーザーがいなければ登録できない' do
        @card.user = nil
        @card.valid?
        expect(@card.errors.full_messages).to include("User must exist")
      end
    end
  end
end
