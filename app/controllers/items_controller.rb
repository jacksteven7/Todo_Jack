class ItemsController < ApplicationController
	before_action :set_list
	before_action :set_item, except: [:create,:destroy]

	def create
		@item = @list.items.create(item_params)
		redirect_to @list
	end

	def destroy
		@item = @list.items.find(params[:id])
		@item.destroy
		redirect_to list_path(@list)
	end
		
	def complete
		@item.update_attribute(:completed, !@item.completed)
		redirect_to @list, notice: "Item completed"
	end
		
	private 

	def set_list
		@list = List.find(params[:list_id])
	end

	def set_item
		@item = @list.items.find(params[:item_id])
	end

	def item_params
		params[:item].permit(:completed,:description)
	end
end
