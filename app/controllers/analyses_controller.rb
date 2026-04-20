class AnalysesController < ApplicationController

    def index
        @saludo = "Hola desde el index controller "
        @analysis = Analysis.new
        @user = current_user

        @users = User.all
    
    end

    def new 
        @saludo = " hola desde new controller"
        @analysis = Analysis.new
    end

    def create
        
        @analysis = Analysis.new(analysis_params)
        if @analysis.save
            redirect_to @analysis
        else 
            render :new, status: :unprocessable_entity
        end    
    end    

    def show 
        @analysis = Analysis.find(params[:id])
        @result = @analysis.process_csv    
    end


    
    private

    def analysis_params
    params.require(:analysis).permit(
        :column_name,
        :operation,
        :csv
    )
    end 

end