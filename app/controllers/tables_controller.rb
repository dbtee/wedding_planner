class TablesController < ApplicationController



def index

    @tables = Table.all
    
end

def new
    @table = Table.new
end

def create

    params[:tcount].to_i.times do
       @table = Table.create(number: Table.all.length)


        for i in 1..params[:scount].to_i do
            Seat.create(number: i, table_id: @table.id)
        end

    end
    redirect_to tables_path
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

def destroy_all
    @tables = Table.all
    if (current_user.is_admin?)
        @tables.destroy_all
        flash[:notice] = "All tables removed from the table list."
        redirect_to tables_path
    else
        flash[:notice] = 'Only admin is authorized to do this.'
        redirect_to(tables_path)
    end
end
    
###############################################################
private





end
