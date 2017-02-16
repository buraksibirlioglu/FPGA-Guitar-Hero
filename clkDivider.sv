module clkDivider(
	input wire clk,		//master clock: 100MHz
	output wire dclk		//pixel clock: 50MHz
	);

        // 17-bit counter variable
        reg [1:0]q;

        // Clock divider --
        // Each bit in q is a clock signal that is
        // only a fraction of the master clock.
        always @(posedge clk )
        begin

              q <= q + 1;
        end

        //100Mhz ÷ 2 = 50MHz
        assign dclk = q[0];

endmodule