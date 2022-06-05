require 'rails_helper'

RSpec.describe OrderDeliverie, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_deliverie = FactoryBot.build(:order_deliverie, user_id: user.id, item_id: item.id)
  end

  describe '商品購入機能' do
    context '商品購入できる場合' do
      it '全ての値が正しく入力されると購入できる' do
        expect(@order_deliverie).to be_valid
      end
      it 'building_nameが空でも購入できる' do
        @order_deliverie.building_name = ''
        expect(@order_deliverie).to be_valid
      end
    end

    context '商品購入できない場合' do
      it 'tokenが空では購入できない' do
        @order_deliverie.token = nil
        @order_deliverie.valid?
        expect(@order_deliverie.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空の場合は購入できない' do
        @order_deliverie.postal_code = ''
        @order_deliverie.valid?
        expect(@order_deliverie.errors.full_messages).to include("Postal code can't be blank")
      end
      it '数字のみでは購入できない' do
        @order_deliverie.postal_code = '1234567'
        @order_deliverie.valid?
        expect(@order_deliverie.errors.full_messages).to include('Postal code is invalid. Include hyden(-)')
      end
      it '半角文字列以外では購入できない' do
        @order_deliverie.postal_code = '１２３-４５６７'
        @order_deliverie.valid?
        expect(@order_deliverie.errors.full_messages).to include('Postal code is invalid. Include hyden(-)')
      end
      it '「3桁ハイフン4桁」以外では購入できない' do
        @order_deliverie.postal_code = '1234-567'
        @order_deliverie.valid?
        expect(@order_deliverie.errors.full_messages).to include('Postal code is invalid. Include hyden(-)')
      end
      it 'prefecture_idが空の場合は購入できない' do
        @order_deliverie.prefecture_id = ''
        @order_deliverie.valid?
        expect(@order_deliverie.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idがid:1を選択したままの場合出品できない' do
        @order_deliverie.prefecture_id = 1
        @order_deliverie.valid?
        expect(@order_deliverie.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'citysが空の場合は購入できない' do
        @order_deliverie.citys = ''
        @order_deliverie.valid?
        expect(@order_deliverie.errors.full_messages).to include("Citys can't be blank")
      end
      it 'addressが空の場合は購入できない' do
        @order_deliverie.address = ''
        @order_deliverie.valid?
        expect(@order_deliverie.errors.full_messages).to include("Address can't be blank")
      end
      it 'phoneが空の場合は購入できない' do
        @order_deliverie.phone = ''
        @order_deliverie.valid?
        expect(@order_deliverie.errors.full_messages).to include("Phone can't be blank")
      end
      it 'phoneが9けた以下では購入できない' do
        @order_deliverie.phone = '090111222'
        @order_deliverie.valid?
        expect(@order_deliverie.errors.full_messages).to include('Phone is invalid')
      end
      it 'phoneが12けた以上では購入できない' do
        @order_deliverie.phone = '090011112222'
        @order_deliverie.valid?
        expect(@order_deliverie.errors.full_messages).to include('Phone is invalid')
      end
      it 'phoneが半角数字以上では購入できない' do
        @order_deliverie.phone = '０１２０-００−００００'
        @order_deliverie.valid?
        expect(@order_deliverie.errors.full_messages).to include('Phone is invalid')
      end
      it 'userが紐付いていなければ購入できない' do
        @order_deliverie.user_id = nil
        @order_deliverie.valid?
        expect(@order_deliverie.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていなければ購入できない' do
        @order_deliverie.item_id = nil
        @order_deliverie.valid?
        expect(@order_deliverie.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
