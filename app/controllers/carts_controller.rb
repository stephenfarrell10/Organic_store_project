class CartsController < ApplicationController
  # GET /carts
  # GET /carts.xml
  def index
    @carts = Cart.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @carts }
    end
  end

  # GET /carts/1
  # GET /carts/1.xml
  def show
    begin
    @cart = Cart.find(params[:id])
    #@reference sam ruby, dave thomas, david heinemeier hanson, agile web development,page121, chapter 10 , fourth edition
    rescue ActiveRecord::RecordNotFound
      logger.error"invalid cart access#{params[:id]}"

      redirect_to products_url,notice:'invalid cart id'
      else

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @cart }
    end
    end
     end

  # GET /carts/new
  # GET /carts/new.xml
  def new
    @cart = Cart.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @cart }
    end
  end

  # GET /carts/1/edit
  def edit
    @cart = Cart.find(params[:id])
  end

  # POST /carts
  # POST /carts.xml
  def create
    @cart = Cart.new(params[:cart])

    respond_to do |format|
      if @cart.save
        format.html { redirect_to(@cart, :notice => 'Cart was successfully created.') }
        format.xml  { render :xml => @cart, :status => :created, :location => @cart }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @cart.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /carts/1
  # PUT /carts/1.xml
  def update
    @cart = Cart.find(params[:id])

    respond_to do |format|
      if @cart.update_attributes(params[:cart])
        format.html { redirect_to(@cart, :notice => 'Cart was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @cart.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1
  # DELETE /carts/1.xml

#@reference sam ruby, dave thomas, david heinemeier hanson, agile web development,page124, chapter 10 , fourth edition

  def destroy
    @cart = current_cart
    @cart.destroy
    #@reference wesley gorman, laptop_shop 4 tutorial, step 7
    session[:cart_id] = nil
    respond_to do |format|
      format.html { redirect_to products_url,notice:'your cart is now empty' }
      format.xml  { head :ok }
    end
  end
  #@reference wesley gorman,laptop_shop 3 tutorial, step18
  def your_cart
    redirect_to :action => "show", :id=> current_cart.id

  end
end
