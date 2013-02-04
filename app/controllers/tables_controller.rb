class TablesController < ApplicationController
  before_filter :authenticate_user!, :except=>['show']
  load_and_authorize_resource :except=>['show']
  def new
    @table = Table.new
    @p_table=Table.find(:last)
  end
  def create
    if request.post?
      no_of_tables=params[:table][:no_of_tables].to_i
      @t_ids=[]
      @p_table=Table.find(:last)
      if @p_table.nil?
        (1..no_of_tables).each do|x|
          @table =Table.create(:table_name=>x)
          @t_ids<<@table.id
        end
      else
        (1..no_of_tables).each do|x|
          @table =Table.create(:table_name=>x+@p_table.table_name.to_i)
          @t_ids<<@table.id
        end
        end
        @t={:id=>@t_ids}
        puts @t.inspect
        respond_to do |format|
     
          if !@t_ids.empty?
            format.html{redirect_to :controller=>'hotelsessions', :action=>'dashboard'}
            format.json {render :json=>@t }
            format.xml{render :xml=>@t}
          else
            format.html{redirect_to :controller=>'hotelsessions', :action=>'dashboard'}
            format.json {render :json=>nil }
            format.xml{render :xml=>nil}
          end
        end
      end
    end
    def show
      @tables=Table.all
      @t=[]
      @tables.each do|x|
        @h={}
        @h[:id]=x.id
        @h[:table_name]=x.table_name
        @t<<@h
      end
      @t1={:tables=>@t}
      respond_to do |format|
        if !@tables.nil?
          format.json{ render :json=>@t1}
          format.xml{render :xml=>@t1}
        else
          format.json{ render :json=>nil}
          format.xml{render :xml=>nil}
        end
      end
    end
  end

