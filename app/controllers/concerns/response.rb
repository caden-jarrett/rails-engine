module Response 
    def json_response(objext, status = :ok)
        render json: objext, status: status
    end
end