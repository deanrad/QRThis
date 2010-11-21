class TemplatesController < ApplicationController
  def index
    @templates = Template.scoped({})
  end
end