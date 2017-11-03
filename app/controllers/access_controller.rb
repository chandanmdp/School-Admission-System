class AccessController < ApplicationController
  def menu
    @notices = Notice.all
    @eligibilities = Eligibility.all
  end
end
