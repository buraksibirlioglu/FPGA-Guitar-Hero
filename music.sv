//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.12.2016 07:59:23
// Design Name: 
// Module Name: music
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

// Music demo verilog file
// (c) fpga4fun.com 2003-2015

// Plays a little tune on a speaker
// Use a 25MHz clock if possible (other frequencies will 
// change the pitch/speed of the song)

/////////////////////////////////////////////////////
module music(
	input clk,
	input start,
	input reset,
	output reg speaker,
	output reg [3:0] showNote,
	output endSong
	
);
//extra try
    reg [7:0] addr;
    int counterForAdress = 3500000;
    logic takeAddress = 1'b0;
    int counterAdress = 0;


    reg [30:0] tone;
    //variables
    int counter = 0;
    int counter1 = 0;
    
    int counterMax = 3000000;
    logic takeNote = 1'b0;
    logic clk_en = 1'b0;
    logic stop;
    logic scoreIcreaseController = 1'b0;
    reg [7:0] noteKeeperAtCurrentTime;
    //segment display values
    reg [3:0] firstDigit, secondDigit, thirdDigit, fourthDigit;
      
    //clockdividing process for 100 mhz to 25 mhz           2
    always@( posedge clk )
        if(start == 1 && stop == 0 ) begin
            counter1 <= counter1 + 1;
        if( counter1 == 3'd4 )
            counter1 <= 3'd0;
        if( counter1 == 30'd0 )
            clk_en <= 1'b1;
        else
            clk_en <= 1'b0;           
    end

    
    //clockdividing process for taking note at particular times           1
    always@( posedge clk )
       if(start == 1 && stop == 0 && clk_en == 1) begin
           counter <= counter + 1;
       if( counter == counterMax )
           counter <= 30'd0;
       if( counter == 30'd0 )
           takeNote <= 1'b1;
       else
           takeNote <= 1'b0;           
    end
    //clockdividing process for taking note at particular times           1
        always@( posedge clk )
           if(start == 1 && stop == 0 && clk_en == 1) begin
               counterAdress <= counterAdress + 1;
           if( counterAdress == counterForAdress )
               counterAdress <= 30'd0;
           if( counterAdress == 30'd0 )
               takeAddress <= 1'b1;
           else
               takeAddress <= 1'b0;           
        end  
        
        
        //////////////////////////
        //if time is came, take next address   
        always @(posedge clk) 
            if(reset == 0) begin
                if(clk_en == 1'b1 && start == 1 && stop == 0 && takeAddress == 1'b1)begin addr <= addr+ 8'd1; end  //
            end
            else
            addr <= 8'd0;
            
            
        ////////////////////////    
        always_comb
            if(addr== 8'd242)
                stop = 1'b1;
            else    
                stop = 1'b0;
                        

        
    //teking full note at particular adress    
    wire [7:0] fullnote;

    music_ROM get_fullnote(.clk(clk_en), .address(addr), .note(fullnote));
    //taking octave value and 4 bit note representation
    wire [2:0] octave;
    wire [3:0] note;
    reg [3:0] goingNote;
    divide_by12 get_octave_and_note(.numerator(fullnote[5:0]), .quotient(octave), .remainder(note));

    //passing current note to takeNoteBit
    always @(posedge clk)
       if(takeNote == 1'b1 && start == 1 && stop == 0  && clk_en == 1)begin
           showNote <= note;
            goingNote <= showNote;
        end

    //determining different clockdividers for different notes to give signal to speaker with different frekanss
    reg [8:0] clkdivider;
    always @*
    case(note)
         0: clkdivider = 9'd511;//A
         1: clkdivider = 9'd482;// A#/Bb
         2: clkdivider = 9'd455;//B
         3: clkdivider = 9'd430;//C
         4: clkdivider = 9'd405;// C#/Db
         5: clkdivider = 9'd383;//D
         6: clkdivider = 9'd361;// D#/Eb
         7: clkdivider = 9'd341;//E
         8: clkdivider = 9'd322;//F
         9: clkdivider = 9'd303;// F#/Gb
        10: clkdivider = 9'd286;//G
        11: clkdivider = 9'd270;// G#/Ab
        default: clkdivider = 9'd0;
    endcase
    
    //to give to speaker a paticular note by clock dividing process 
    reg [8:0] counter_note;
    reg [7:0] counter_octave;
    always @(posedge clk)  if(clk_en == 1'b1 && start == 1  && stop == 0)begin  counter_note <= counter_note==0 ? clkdivider : counter_note-9'd1; end
    always @(posedge clk) if(clk_en == 1'b1 && start == 1  && stop == 0)begin if(counter_note==0) counter_octave <= counter_octave==0 ? 8'd255 >> octave : counter_octave-8'd1; end
    
    
    always @(posedge clk)  if(clk_en == 1'b1 && start == 1  && stop == 0)begin if(counter_note==0 && counter_octave==0 && fullnote!=0) speaker <= ~speaker; end
    //working the equalith checker method the check if button input is equal or not to the current note and increase or decrease the score
    assign endSong=stop;


endmodule