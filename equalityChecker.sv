module EqualityChecker(
    input [3:0] comingNote,
    input [3:0] clickedButtons,
    output reg result
    );
    

         //clockdividing process
     always@(*)
         begin
            //if( comingNote == sendButtonStates)
            if( comingNote == clickedButtons)
              result <= 1'b1;
            else    
             result <= 1'b0;
         end

    
endmodule