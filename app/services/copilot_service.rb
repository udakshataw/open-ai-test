require 'httparty'
require 'json'

class CopilotService
  include HTTParty
  base_uri ENV['AZURE_OPENAI_ENDPOINT']

  def initialize
    @headers = {
      "Content-Type" => "application/json",
      "api-key" => ENV['AZURE_OPENAI_API_KEY']  # Use 'api-key' instead of 'Authorization'
    }
  end

  def generate_response(prompt)
    body = {
      "messages": [
        { "role": "system", "content": "You are an AI assistant." },
        { "role": "user", "content": prompt }
      ],
      "max_tokens": 100
    }

    response = self.class.post(
      "/openai/deployments/#{ENV['AZURE_OPENAI_DEPLOYMENT']}/chat/completions?api-version=2024-02-15-preview",
      headers: @headers,
      body: body.to_json
    )

    puts "---------->>>>>>>>> Response from Copilot: #{response}"

    parsed_response = JSON.parse(response.body)
    
    if response.code == 200
      parsed_response["choices"][0]["message"]["content"]
    else
      "Error: #{parsed_response['message'] || 'Unable to process request'}"
    end
  end
end
