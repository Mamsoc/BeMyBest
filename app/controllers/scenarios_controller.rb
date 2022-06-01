class ScenariosController < ApplicationController

def edit
  @scenarios = Scenario.all
end

end
