class BabiesController < ApplicationController
  def new
    @baby = Baby.new
  end

  def create

  end

  def edit

  end

  def update

  end

  def index
    @babies = Baby.all
  end

  def show

  end


  def baby_params
    params.require(:baby).permit(:name, :sex, :dob, :picture, :allergies, :emergency_contact, :mom_id)
  end
end

t.string  :name
t.string  :sex
t.date    :dob
t.string  :picture
t.text    :allergies
t.string  :emergency_contact
t.integer :mom_id
