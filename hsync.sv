module hsync(
   input clk50,
   output hsync_out, blank_out, newline_out,[10:0]x_crd);
   
   reg [10:0] count = 11'b0000000000; //pixel counter horizontal
   reg hsync 	= 0; //sync variable
   reg blank 	= 0; //blannk variable
   reg newline 	= 0; //newline variable to control vertical sync

   always @(posedge clk50) //whole screen
	 begin
		if (count < 1040)
		  count  <= count + 1;
		else
		  count  <= 0;
	 end
   
   always @(posedge clk50) //when one line of screen passed
	 begin
		if (count == 0)
		  newline <= 1;
		else
		  newline <= 0;
	 end

   always @(posedge clk50) //visible area
	 begin
		if (count >= 800)
		  blank  <= 1;
		else
		  blank  <= 0;
	 end

   always @(posedge clk50)
	 begin
		if (count < 856) // pixel data plus front porch
		  hsync <= 1;
		else if (count >= 856 && count < 976) //invisible area
		  hsync <= 0;
		else if (count >= 976) //retrace
		  hsync <= 1;
	 end // always @ (posedge clk50)
				 
   assign hsync_out    = hsync;
   assign blank_out    = blank;
   assign newline_out  = newline;
   assign x_crd        = count; //x coordinate for color module
   
endmodule // hsync