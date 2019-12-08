class TablesController < ApplicationController



def index

    @tables = Table.all
    
end

def new
    @table = Table.new
end

def create
    # byebug

    @table = Table.new table_params

    if @table.save && current_user.is_admin=true
        flash[:notice] = 'Table successfully added.'
        
        for i in 1..12 do
            Seat.create(number: i, table_id: @table.id)
        end
        

        redirect_to tables_path
    else
        redirect_to tables_path
    end

end


def destroy
    @table = Table.find params[:id]
    if (current_user.is_admin?)
        @table.destroy
        flash[:notice] = "Table removed from table list."
        redirect_to tables_path

    else
        flash[:notice] = 'Only admin is authorized to do this.'
            redirect_to(tables_path)
    end
end
###############################################################
private

def table_params
    params.permit(:number)
end


end
