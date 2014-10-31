class BehaviorsController < ApplicationController

def index
  @behaviors = Behavior.all
end

end
