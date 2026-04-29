class AnalysesController < ApplicationController

    def index
        @saludo = "Hola desde el index controller "
        @analysis = Analysis.new
        @user = current_user
        @datos = Analysis.all
    

        @users = User.all
    
    end

    def new 
        # renderiza solo el formulario 

        @saludo = " hola desde new controller de new"
        @analysis = Analysis.new
    end

    def create# se encarga de procesar el formulario
        @analysis = Analysis.new(analysis_params)
        if @analysis.save  
            resultado = @analysis.process_csv    
            @analysis.update(Result: resultado)         

            redirect_to @analysis
        else 
            render :new, status: :unprocessable_entity
        end 

        
        
       
              
          
              
    end    

    def show 
        @analysis = Analysis.find(params[:id])
        @result = @analysis.Result 
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