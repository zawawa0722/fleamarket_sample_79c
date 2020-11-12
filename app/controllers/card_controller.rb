class CardController < ApplicationController

  before_action :return_to_root
  before_action :set_card, only: [:new, :desroy, :purchase, :show]

  require "payjp"

  def index
  end
  
  def new
    if @card.present? #カードが登録されている場合
      redirect_to action: "show"
    else
      card = Card.where(user_id: current_user.id).first
    end
  end

  def create
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    if params['payjpToken'].blank?
      redirect_to action: "new", alert: "クレジットカードを登録できませんでした。"
    else
      customer = Payjp::Customer.create(
        card: params['payjpToken'],
      )
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to purchase_index_path
      else
        redirect_to action: "new"
      end
    end
  end

  
  def show 
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to action: "new" 
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  private
    def return_to_root #ログインしていなければトップ画面に遷移
      redirect_to root_path unless user_signed_in?
    end

    def set_card #各アクション内でuser_idとDBに保存されたcard情報を紐付け
      @card = Card.find_by(user_id: current_user.id)
    end

end
