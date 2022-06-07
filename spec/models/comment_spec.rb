require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe 'コメント機能' do
    context 'コメントできる場合' do
      it 'textが存在するとコメントできる' do
        expect(@comment).to be_valid
      end
    end

    context 'コメントできない場合' do
      it 'textが空の場合コメントできない' do
        @comment.text = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Text can't be blank")
      end
      it 'textが201文字以上ではコメントできない' do
        @comment.text = Faker::Lorem.characters(number: 201)
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Text is too long (maximum is 200 characters)")
      end
      it 'useが紐付いていない場合コメントできない' do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("User must exist")
      end
      it 'itemが紐付いていない場合コメントできない' do
        @comment.item = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Item must exist")
      end
    end
  end
end
