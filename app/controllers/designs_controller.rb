class DesignsController < ApplicationController
  def index
    @designs = Design.scoped({})
  end
end