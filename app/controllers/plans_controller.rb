class PlansController < ApplicationController
  before_action :set_plan, only: [:show, :edit, :update, :destroy]

  # GET /plans
  def index
    @plans = Plan.all
  end

  # GET /plans/1
  def show
  end

  # GET /plans/new
  def new
    @plan = Plan.new
  end

  # GET /plans/1/edit
  def edit
  end

  # POST /plans
  def create
    plan = plan_params
    plan[:user_id] = @user.id
    @plan = Plan.new(plan)

    respond_to do |format|
      if @plan.save
        format.html { redirect_to @plan, notice: 'Plan was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /plans/1
  def update

    if @user.kanji?(@plan)
      plan = @plan.update(plan_params)
    else
      plan = @plan.attach(@user)
    end

    respond_to do |format|
      if plan
        format.html { redirect_to @plan, notice: 'Plan was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /plans/1
  def destroy
    @plan.destroy
    respond_to do |format|
      format.html { redirect_to plans_url, notice: 'Plan was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plan
      @plan = Plan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def plan_params
      params.require(:plan).permit(:title, :detail, :user_id, :size)
    end
end
