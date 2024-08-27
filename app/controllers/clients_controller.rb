class ClientsController < ApplicationController
    # GET /clients
    # Lista todos los clientes que tienen el estado activo.

    def index
        @clients = Client.active
    end
    # GET /clients/:id
    # Muestra un cliente específico basado en el ID proporcionado.

    def show
        @client = Client.find(params[:id])
    end

    # POST /clients
    # Crea un nuevo cliente con los parámetros permitidos.
    # Si se guarda correctamente, devuelve el cliente creado, de lo contrario, devuelve errores.
    def create
        @client = Client.new(client_params.merge(is_old: false))

        if @client.save
          render json: @client, status: :created, location: @client
        else
          render json: { errors: @client.errors.full_messages }, status: :unprocessable_entity
        end
    end
    # PATCH/PUT /clients/:id
    # Actualiza un cliente específico basado en el ID proporcionado.
    # Si se actualiza correctamente, devuelve el cliente actualizado, de lo contrario, devuelve errores.
    def update
        @client = Client.find(params[:id])

        if @client.update(client_params)
            render json: @client, status: :ok
        else
            render json: { errors: @client.errors.full_messages }, status: :unprocessable_entity
        end
    end

    # DELETE /clients/:id
    # Elimina un cliente específico basado en el ID proporcionado.
    def destroy
        client = Client.find(params[:id])
        client.destroy
    end

    private

    # Define los parámetros permitidos para crear o actualizar un cliente.
    def client_params
        params.require(:client).permit(:name, :last_name, :email, :b_date, :status,
                                       :contact_means, :phone, :address, :personal_description)
    end

    # Método privado para buscar un cliente por ID antes de ciertas acciones.
    def set_client
        @client = Client.find(params[:id])
    end
end
