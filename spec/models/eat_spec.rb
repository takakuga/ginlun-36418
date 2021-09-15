require 'rails_helper'

RSpec.describe Eat, type: :model do
  before do
    @eat = FactoryBot.build(:eat)
  end

  describe '新規投稿' do
    context '新規投稿ができるとき' do
      it 'image,title,shop_name,category,price,detailが入力されたら投稿できる' do
        expect(@eat).to be_valid
      end
      it 'ログイン状態のユーザーのみ、新規投稿ページへ遷移できること' do
        @eat = FactoryBot.create(:user)
        expect(@eat).to be_valid
      end
    end

      context '新規投稿が出来ないとき' do
        it '商品画像を1枚つけることが必須であること' do
          @eat.image.key = ''
          @eat.valid?
          expect(@eat.errors.full_messages).to include { "Image can't be blank" }
        end
        it 'titleが空だと投稿できない' do
          @eat.title = ''
          @eat.valid?
          expect(@eat.errors.full_messages).to include("Title can't be blank")
        end
        it 'shop_nameが空では投稿できない' do
          @eat.shop_name = ''
          @eat.valid?
          expect(@eat.errors.full_messages).to include("Shop name can't be blank")
        end
        it 'カテゴリーが空では投稿できない' do
          @eat.category = ''
          @eat.valid?
          expect(@eat.errors.full_messages).to include("Category can't be blank")
        end
        it '価格が空だと投稿できない' do
          @eat.price = ''
          @eat.valid?
          expect(@eat.errors.full_messages).to include("Price can't be blank")
        end
        it '詳細が空だと投稿できない' do
          @eat.detail = ''
          @eat.valid?
          expect(@eat.errors.full_messages).to include("Detail can't be blank")
        end
        it 'ユーザーが紐付いていないと出品できない' do
          @eat.user = nil
          @eat.valid?
          expect(@eat.errors.full_messages).to include('User must exist')
        end
      end
    end
  end
