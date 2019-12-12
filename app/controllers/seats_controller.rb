class SeatsController < ApplicationController



    def create

          @table = Table.find(params[:table_id])
          @seat = Seat.new seat_params
          @seat.table = @table

          if @seat.save
            redirect_to tables_path
          end
    end

    def update

       
        @table = Table.find(params[:table_id])
        @seat = Seat.find_by id: params[:id]
        # old_seat = @table.seats.find_by user_id: current_user.id
        old_seat = Seat.all.find_by user_id: current_user.id
         
        if old_seat != nil
          old_seat.user_id = nil
          old_seat.save
         end
        @seat.user = current_user
        @seat.update(user: current_user)
        @tables = Table.all()
   
        render "tables/index"
    end


    def destroy
        @seat = seat.find params[:id]
        if can? :crud, @seat
          @seat.destroy
          redirect_to table_path(@seat.table)
        else
            redirect_to root_path, alert: 'Not authorized'
        end
    end

    private

    def seat_params
      params.permit(:user_id, :id)
    end
end
