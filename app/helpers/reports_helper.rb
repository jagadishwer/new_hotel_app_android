module ReportsHelper
  def estimated_quantity(s)
    @present_remaining_item = s
    
    @stock_list_item=@present_remaining_item.stock_list_item
    @items = @stock_list_item.recipes.collect do |recipe|
      recipe.item
    end
    @estimated_usage=0
    @items.each do |item|
      @estimated_usage+=item.recipes.sum(:quantity,:conditions=>{:stock_list_item_id=>@stock_list_item.id})*item.orderlists.sum(:quantity,:conditions=>{:created_at=>(@previous_stock_count.created_at..@present_remaining_item.created_at)})
    end
    return @estimated_usage
  end
  def actual_quantity
    
      @deliveries=Delivery.where(:created_at=>(@previous_stock_count.created_at..@present_remaining_item.created_at))
    @delivery_quantity=0
    @deliveries.each do |d|
      @delivery_quantity += d.delivery_items.sum(:quantity,:conditions=>{:stock_list_item_id=>@present_remaining_item.stock_list_item_id})
    end
    @previous_count_quantity=@previous_stock_count.remaining_items.sum(:quantity,:conditions=>{:stock_list_item_id=>@present_remaining_item.stock_list_item_id})
    @actual_usage= @previous_count_quantity+@delivery_quantity-@present_remaining_item.quantity
    return @actual_usage
  end

  def estimated_quantity_from_start(s)
    @present_remaining_item = s

    @stock_list_item=@present_remaining_item.stock_list_item
    @items = @stock_list_item.recipes.collect do |recipe|
      recipe.item
    end
    @estimated_usage=0
    @items.each do |item|
      @estimated_usage+=item.recipes.sum(:quantity,:conditions=>{:stock_list_item_id=>@stock_list_item.id})*item.orderlists.sum(:quantity,:conditions=>['created_at <?',@present_remaining_item.created_at])
    end
    return @estimated_usage
  end
  def actual_quantity_from_start
@deliveries=Delivery.where('created_at <?',@present_remaining_item.created_at)
      #@deliveries=Delivery.where(:created_at=>(@previous_stock_count.created_at..@present_remaining_item.created_at))
    @delivery_quantity=0
    @deliveries.each do |d|
      @delivery_quantity += d.delivery_items.sum(:quantity,:conditions=>{:stock_list_item_id=>@present_remaining_item.stock_list_item_id})
    end
    #@previous_count_quantity=@previous_stock_count.remaining_items.sum(:quantity,:conditions=>{:stock_list_item_id=>@present_remaining_item.stock_list_item_id})
    @actual_usage= @delivery_quantity-@present_remaining_item.quantity
    return @actual_usage
  end



 
  def difference
    @difference= (@estimated_usage-@actual_usage)
  end
  def difference_worth
    @difference_worth=(@estimated_usage-@actual_usage)*@present_remaining_item.mrp
    unless @total_difference_worth.nil?
    @total_difference_worth+=@difference_worth
    else
      @total_difference_worth = @difference_worth
    end
    return @difference_worth
  end
  def total_difference_worth

    return @total_difference_worth
  end



  def icon(i)
    if i<0
            "<i class='icon-thumbs-down'></i>"
     elsif i>0
            "<i class='icon-thumbs-up'></i>"
    end

  end
end
