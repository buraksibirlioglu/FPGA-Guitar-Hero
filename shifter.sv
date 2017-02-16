module shifter( input clk,
                input reset,start,
                input logic [3:0]data, //input data that will be diplayed at first row
                output [39:0]out, //output data which controls the color module
                output reg[3:0]check, //data of last line that will be comparised with clickedButtons
                output enable); //enable to control comparison event

        reg [39:0]current=40'b0000000000000000000000000000000000000000; //will be output 
        reg [39:0]array=40'b0000000000000000000000000000000000000000; //array that supply continuity of shifter
        reg [3:0]dtemp; //temp register which controls shifting event and prevent infinite loop
        logic control; //infinite loop control variable
        integer i; //for the for loop
        logic shift=1'b0; 
        integer counter=0; //shifter inner clock implementation
        always@( posedge clk )
              begin
                   counter <= counter + 1;
               if( counter == 35000000 )
                   counter <= 30'd0;
               if( counter == 30'd0 )
                   shift <= 1'b1;
               else
                   shift <= 1'b0;           
            end
    
        always @(posedge shift) //shifting 
                begin
                if((reset==1)) //if reset output are zero
                begin
                      current=40'b0000000000000000000000000000000000000000;
                        array=40'b0000000000000000000000000000000000000000; end
                else if(start==0) 
                        current=array;
                else begin
                for(i=4; i<=39; i=i+1)
                    current[i-4]=array[i]; //assigning values except first four  
                current[36]=data[0]; //assigning first for digit 
                current[37]=data[1];
                current[38]=data[2];
                current[39]=data[3];             
                array=current;
                dtemp=data;
                end
                end

        assign out=current; 
        assign check=current[3:0]; //last line of diplay  
        assign enable=~shift; //to control comparison event
        
          
        
endmodule