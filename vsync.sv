module vsync(
   input line_clk,
   output vsync_out,blank_out,[10:0]y_crd);
   
   reg [10:0] count = 11'b0000000000; //veritcal line counter
   reg vsync  = 0;
   reg blank  = 0; //blank line register

   always @(posedge line_clk) //whole screen all lines
	 if (count < 666)
	   count <= count + 1;
	 else
	   count <= 0;
   
   always @(posedge line_clk) //visible area
	 if (count < 600)
	   blank 		<= 0;
	 else
	   blank 		<= 1;
      
   always @(posedge line_clk)
	 begin
		if (count < 637) //front porch plus visible area
		  vsync 	<= 1;
		else if (count >= 637 && count < 643) //invisible area
		  vsync 	<= 0;
		else if (count >= 643) //retrace
		  vsync 	<= 1;
	 end

   assign vsync_out  = vsync;
   assign blank_out  = blank;
   assign y_crd      = count; //y coordinate for color module
   
endmodule // vsync 