class CopilotController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:ask]

    def index
    end
  
    def ask
      prompt = params[:prompt]
      copilot_service = CopilotService.new
      @response = copilot_service.generate_response(prompt)
      puts ">>>>>>>>>>>>>>>> Response: #{@response} <<<<<<<<<<<"
      render json: { response: @response }
    end
end  