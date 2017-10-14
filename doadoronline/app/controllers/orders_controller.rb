class OrdersController < ApplicationController
  #authorize_resource class: :orders
  before_action :set_order, only: [:destroy, :update, :edit ]

  def new
    @order = Order.new
  end

  def edit
    #@order = Order.find(params[:id])
  end

  def update
    #@order = Order.find(params[:id])
    @order.assign_attributes(order_params)

    if @order.save
      redirect_to orders_path, notice: "Pedido foi Atualizado com sucesso"
    else
      render :edit
    end
  end

  def index
    @orders = Order.all
  end

  def create
    @order = Order.new(order_params)

    if @order.save
      redirect_to orders_path, notice: "Pedido cadastrado com sucesso!"
    else
      render :new
    end
  end

  # def destroy
  #   begin
  #     #@order = Order.find(params[:id])
  #     @order.delete
  #     redirect_to orders_path, notice: "Pedido removido com sucesso"
  #   rescue
  #     redirect_to orders_path, notice: "Pedido não pode ser removido"
  #   end
  # end

  def destroy
    respond_to do |format|
      begin
        @order.delete
        format.html { redirect_to orders_path, notice: "Pedido removido com sucesso" }
        format.js
      rescue
        format.html { redirect_to orders_path, notice: "Pedido não pode ser removido" }
        format.js
      end
    end
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:nome,:dtanascimento,:telefone,:email,:dtaagendada,:doador,:tpsanguineo)
  end
end
