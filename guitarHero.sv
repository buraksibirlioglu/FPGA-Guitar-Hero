module guitarHero(
    input clk, start, reset,
	input [3:0] clickedButtons,
	output reg speaker,correctness,
	output reg [3:0] showNote,
    output logic hsync, vsync, 
    [3:0] red, blue, green,
    output a, b, c, d, e, f, g, dp, //7 segment display controls
    output [3:0] an, //7 segment display controls
    output [3:0]led); //leds for notes 
    reg [12:0] score = 0; //player score
   wire line_clk, blank, hblank, vblank, clk50; //vga controls and vga clock
   logic [10:0]x,y; //xand y coordinates of screen pixel
   logic [10:0]y1=11'd0; //starting point for boxes
   logic [10:0]y2=11'd50; //ending point for first box
   logic shift; //shifter output timinG
   logic control; 
   reg [3:0]check; //check register
   wire [39:0]n1; //vga data taht will be displayed

   music msc(clk,start,reset,speaker,showNote,stop); //music module
   shifter shifting(clk,reset,start,showNote,n1,check,shift); //shifter module to move boxes downwards
   EqualityChecker checkButtonsandNoteEquality(check,~clickedButtons,correctness); //equality checker
   always @(posedge shift) //score updater 
           if(reset == 0 )begin 
               if(shift == 1'b1 && start == 1 )begin
                   if(correctness == 1 && check!=4'b0000)
                       score = score + 1'b1; //increase score

               end 
           end
               else
                   score = 0; //if reset or not start score=0
                   
   logic [3:0]in1,in2,in3,in0; //seven segment diplay inputs
   always @(posedge shift) //score to 4 digit for diplaying in seven segment
       begin
           in0=score%10;
           in1=(score/10)%10;
           in2=(score/100)%10;
           in3=(score/1000)%10;
       end
   ssg seven(clk,in0,in1,in2,in3,a, b, c, d, e, f, g, dp,an); //seven segment module
   clkDivider clock (clk,clk50); //clock divider for vga sync
   hsync   hs(clk50, hsync, hblank, line_clk,x); //horizontal
   vsync   vs(line_clk, vsync, vblank,y);  //vertical
   color   cg(clk50,x,y,y1,y2,n1 ,red, green, blue); //darawing and painting boxes
   assign blank 	 = hblank || vblank; //if one of the sync outputs are blank it show screen blank
   assign led=clickedButtons; //cliked buttons to leds to check
endmodule // guitarHero