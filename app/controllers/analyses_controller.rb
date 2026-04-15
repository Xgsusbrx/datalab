class AnalysesController < ApplicationController

    def index
        @saludo = "Hola desde el index"
        @user = current_user


    
    end

    def new 
        @saludo = " hola desde new"
        @analyses = Analysis.new
    end


end