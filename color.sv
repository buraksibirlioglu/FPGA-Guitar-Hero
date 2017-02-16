module color(
   input clk,
   input [10:0]x,y,y1,y2, //starting and ending points of boxes
   input [39:0]sw, //first data that enters the shifter it will be 40bits zero
   output [3:0] red_out, green_out, blue_out); //rgb outputs 
   logic [2:0]rgb=3'b100; //initialization of rgb

   always
     begin
         if((y>=y1)&&(y<=y2)) //first line
            case(sw[39:36])
            4'b1000:if((x>=11'd100)&&(x<=11'd250)) rgb=3'b110; else rgb=3'b000;
            4'b0100:if((x>=11'd250)&&(x<=11'd400)) rgb=3'b100; else rgb=3'b000;
            4'b0010:if((x>=11'd400)&&(x<=11'd550)) rgb=3'b010; else rgb=3'b000;
            4'b0001:if((x>=11'd550)&&(x<=11'd700)) rgb=3'b001; else rgb=3'b000;
            4'b1100:begin if((x>=11'd100)&&(x<=11'd250)) rgb=3'b110; else if((x>=11'd250)&&(x<=11'd400)) rgb=3'b100; else rgb=3'b000; end
            4'b1110:begin if((x>=11'd100)&&(x<=11'd250)) rgb=3'b110; else if((x>=11'd250)&&(x<=11'd400)) rgb=3'b100; else if((x>=11'd400)&&(x<=11'd550)) rgb=3'b010; else rgb=3'b000; end
            4'b1111:begin if((x>=11'd100)&&(x<=11'd250)) rgb=3'b110; else if((x>=11'd250)&&(x<=11'd400)) rgb=3'b100; else if((x>=11'd400)&&(x<=11'd550)) rgb=3'b010;else if((x>=11'd550)&&(x<=11'd700)) rgb=3'b001; else rgb=3'b000; end
            4'b1010:begin if((x>=11'd400)&&(x<=11'd550)) rgb=3'b010; else if((x>=11'd100)&&(x<=11'd250)) rgb=3'b110; else rgb=3'b000; end
            4'b0110:begin if((x>=11'd250)&&(x<=11'd400)) rgb=3'b100; else if((x>=11'd400)&&(x<=11'd550)) rgb=3'b010; else rgb=3'b000; end
            4'b1001:begin if((x>=11'd550)&&(x<=11'd700)) rgb=3'b001; else if((x>=11'd100)&&(x<=11'd250)) rgb=3'b110; else rgb=3'b000; end
            4'b0101:begin if((x>=11'd550)&&(x<=11'd700)) rgb=3'b001; else if((x>=11'd250)&&(x<=11'd400)) rgb=3'b100; else rgb=3'b000; end
            4'b0011:begin if((x>=11'd550)&&(x<=11'd700)) rgb=3'b001; else if((x>=11'd400)&&(x<=11'd550)) rgb=3'b010; else rgb=3'b000; end
            4'b1101:begin if((x>=11'd550)&&(x<=11'd700)) rgb=3'b001; else if((x>=11'd250)&&(x<=11'd400)) rgb=3'b100; else if((x>=11'd100)&&(x<=11'd250)) rgb=3'b110; else rgb=3'b000; end
            4'b1011:begin if((x>=11'd550)&&(x<=11'd700)) rgb=3'b001; else if((x>=11'd100)&&(x<=11'd250)) rgb=3'b110; else if((x>=11'd400)&&(x<=11'd550)) rgb=3'b010; else rgb=3'b000; end
            4'b0111:begin if((x>=11'd550)&&(x<=11'd700)) rgb=3'b001; else if((x>=11'd400)&&(x<=11'd550)) rgb=3'b010; else if((x>=11'd250)&&(x<=11'd400)) rgb=3'b100; else rgb=3'b000;end
            4'b0000:rgb=3'b000;
            endcase
         else if((y>=(y1+60))&&(y<=(y2+60)))  //second line                                                                                                                                                                  
               case(sw[35:32])                                                                                                                                                                             
               4'b1000:if((x>=11'd100)&&(x<=11'd250)) rgb=3'b110; else rgb=3'b000;                                                                                                                  
               4'b0100:if((x>=11'd250)&&(x<=11'd400)) rgb=3'b100; else rgb=3'b000;                                                                                                                  
               4'b0010:if((x>=11'd400)&&(x<=11'd550)) rgb=3'b010; else rgb=3'b000;                                                                                                                  
               4'b0001:if((x>=11'd550)&&(x<=11'd700)) rgb=3'b001; else rgb=3'b000;                                                                                                                  
               4'b1100:begin if((x>=11'd100)&&(x<=11'd250)) rgb=3'b110; else if((x>=11'd250)&&(x<=11'd400)) rgb=3'b100; else rgb=3'b000; end                                                                                                 
               4'b1110:begin if((x>=11'd100)&&(x<=11'd250)) rgb=3'b110; else if((x>=11'd250)&&(x<=11'd400)) rgb=3'b100; else if((x>=11'd400)&&(x<=11'd550)) rgb=3'b010; else rgb=3'b000; end                                                 
               4'b1111:begin if((x>=11'd100)&&(x<=11'd250)) rgb=3'b110; else if((x>=11'd250)&&(x<=11'd400)) rgb=3'b100; else if((x>=11'd400)&&(x<=11'd550)) rgb=3'b010;else if((x>=11'd550)&&(x<=11'd700)) rgb=3'b001; else rgb=3'b000; end  
               4'b1010:begin if((x>=11'd400)&&(x<=11'd550)) rgb=3'b010; else if((x>=11'd100)&&(x<=11'd250)) rgb=3'b110; else rgb=3'b000; end                                                                                                 
               4'b0110:begin if((x>=11'd250)&&(x<=11'd400)) rgb=3'b100; else if((x>=11'd400)&&(x<=11'd550)) rgb=3'b010; else rgb=3'b000; end                                                                                                 
               4'b1001:begin if((x>=11'd550)&&(x<=11'd700)) rgb=3'b001; else if((x>=11'd100)&&(x<=11'd250)) rgb=3'b110; else rgb=3'b000; end                                                                                                 
               4'b0101:begin if((x>=11'd550)&&(x<=11'd700)) rgb=3'b001; else if((x>=11'd250)&&(x<=11'd400)) rgb=3'b100; else rgb=3'b000; end                                                                                                 
               4'b0011:begin if((x>=11'd550)&&(x<=11'd700)) rgb=3'b001; else if((x>=11'd400)&&(x<=11'd550)) rgb=3'b010; else rgb=3'b000; end                                                                                                 
               4'b1101:begin if((x>=11'd550)&&(x<=11'd700)) rgb=3'b001; else if((x>=11'd250)&&(x<=11'd400)) rgb=3'b100; else if((x>=11'd100)&&(x<=11'd250)) rgb=3'b110; else rgb=3'b000; end                                                 
               4'b1011:begin if((x>=11'd550)&&(x<=11'd700)) rgb=3'b001; else if((x>=11'd100)&&(x<=11'd250)) rgb=3'b110; else if((x>=11'd400)&&(x<=11'd550)) rgb=3'b010; else rgb=3'b000; end                                                 
               4'b0111:begin if((x>=11'd550)&&(x<=11'd700)) rgb=3'b001; else if((x>=11'd400)&&(x<=11'd550)) rgb=3'b010; else if((x>=11'd250)&&(x<=11'd400)) rgb=3'b100; else rgb=3'b000;end                                                  
               4'b0000:rgb=3'b000;
               endcase 
         else if((y>=(y1+120))&&(y<=(y2+120))) //  third line                                                                                                                                                                                                      
               case(sw[31:28])                                                                                                                                                                                                                              
               4'b1000:if((x>=11'd100)&&(x<=11'd250)) rgb=3'b110; else rgb=3'b000;                                                                                                                                                                   
               4'b0100:if((x>=11'd250)&&(x<=11'd400)) rgb=3'b100; else rgb=3'b000;                                                                                                                                                                   
               4'b0010:if((x>=11'd400)&&(x<=11'd550)) rgb=3'b010; else rgb=3'b000;                                                                                                                                                                   
               4'b0001:if((x>=11'd550)&&(x<=11'd700)) rgb=3'b001; else rgb=3'b000;                                                                                                                                                                   
               4'b1100:begin if((x>=11'd100)&&(x<=11'd250)) rgb=3'b110; else if((x>=11'd250)&&(x<=11'd400)) rgb=3'b100; else rgb=3'b000; end                                                                                                          
               4'b1110:begin if((x>=11'd100)&&(x<=11'd250)) rgb=3'b110; else if((x>=11'd250)&&(x<=11'd400)) rgb=3'b100; else if((x>=11'd400)&&(x<=11'd550)) rgb=3'b010; else rgb=3'b000; end                                                          
               4'b1111:begin if((x>=11'd100)&&(x<=11'd250)) rgb=3'b110; else if((x>=11'd250)&&(x<=11'd400)) rgb=3'b100; else if((x>=11'd400)&&(x<=11'd550)) rgb=3'b010;else if((x>=11'd550)&&(x<=11'd700)) rgb=3'b001; else rgb=3'b000; end           
               4'b1010:begin if((x>=11'd400)&&(x<=11'd550)) rgb=3'b010; else if((x>=11'd100)&&(x<=11'd250)) rgb=3'b110; else rgb=3'b000; end                                                                                                          
               4'b0110:begin if((x>=11'd250)&&(x<=11'd400)) rgb=3'b100; else if((x>=11'd400)&&(x<=11'd550)) rgb=3'b010; else rgb=3'b000; end                                                                                                          
               4'b1001:begin if((x>=11'd550)&&(x<=11'd700)) rgb=3'b001; else if((x>=11'd100)&&(x<=11'd250)) rgb=3'b110; else rgb=3'b000; end                                                                                                          
               4'b0101:begin if((x>=11'd550)&&(x<=11'd700)) rgb=3'b001; else if((x>=11'd250)&&(x<=11'd400)) rgb=3'b100; else rgb=3'b000; end                                                                                                          
               4'b0011:begin if((x>=11'd550)&&(x<=11'd700)) rgb=3'b001; else if((x>=11'd400)&&(x<=11'd550)) rgb=3'b010; else rgb=3'b000; end                                                                                                          
               4'b1101:begin if((x>=11'd550)&&(x<=11'd700)) rgb=3'b001; else if((x>=11'd250)&&(x<=11'd400)) rgb=3'b100; else if((x>=11'd100)&&(x<=11'd250)) rgb=3'b110; else rgb=3'b000; end                                                          
               4'b1011:begin if((x>=11'd550)&&(x<=11'd700)) rgb=3'b001; else if((x>=11'd100)&&(x<=11'd250)) rgb=3'b110; else if((x>=11'd400)&&(x<=11'd550)) rgb=3'b010; else rgb=3'b000; end                                                          
               4'b0111:begin if((x>=11'd550)&&(x<=11'd700)) rgb=3'b001; else if((x>=11'd400)&&(x<=11'd550)) rgb=3'b010; else if((x>=11'd250)&&(x<=11'd400)) rgb=3'b100; else rgb=3'b000;end                                                           
               4'b0000:rgb=3'b000;
               endcase
            else if((y>=(y1+180))&&(y<=(y2+180)))  //fourth line                                                                                                                                                                                                       
                     case(sw[27:24])                                                                                                                                                                                                                              
                     4'b1000:if((x>=11'd100)&&(x<=11'd250)) rgb=3'b110; else rgb=3'b000;                                                                                                                                                                   
                     4'b0100:if((x>=11'd250)&&(x<=11'd400)) rgb=3'b100; else rgb=3'b000;                                                                                                                                                                   
                     4'b0010:if((x>=11'd400)&&(x<=11'd550)) rgb=3'b010; else rgb=3'b000;                                                                                                                                                                   
                     4'b0001:if((x>=11'd550)&&(x<=11'd700)) rgb=3'b001; else rgb=3'b000;                                                                                                                                                                   
                     4'b1100:begin if((x>=11'd100)&&(x<=11'd250)) rgb=3'b110; else if((x>=11'd250)&&(x<=11'd400)) rgb=3'b100; else rgb=3'b000; end                                                                                                     
                     4'b1110:begin if((x>=11'd100)&&(x<=11'd250)) rgb=3'b110; else if((x>=11'd250)&&(x<=11'd400)) rgb=3'b100; else if((x>=11'd400)&&(x<=11'd550)) rgb=3'b010; else rgb=3'b000; end                                                     
                     4'b1111:begin if((x>=11'd100)&&(x<=11'd250)) rgb=3'b110; else if((x>=11'd250)&&(x<=11'd400)) rgb=3'b100; else if((x>=11'd400)&&(x<=11'd550)) rgb=3'b010;else if((x>=11'd550)&&(x<=11'd700)) rgb=3'b001; else rgb=3'b000; end      
                     4'b1010:begin if((x>=11'd400)&&(x<=11'd550)) rgb=3'b010; else if((x>=11'd100)&&(x<=11'd250)) rgb=3'b110; else rgb=3'b000; end                                                                                                     
                     4'b0110:begin if((x>=11'd250)&&(x<=11'd400)) rgb=3'b100; else if((x>=11'd400)&&(x<=11'd550)) rgb=3'b010; else rgb=3'b000; end                                                                                                     
                     4'b1001:begin if((x>=11'd550)&&(x<=11'd700)) rgb=3'b001; else if((x>=11'd100)&&(x<=11'd250)) rgb=3'b110; else rgb=3'b000; end                                                                                                     
                     4'b0101:begin if((x>=11'd550)&&(x<=11'd700)) rgb=3'b001; else if((x>=11'd250)&&(x<=11'd400)) rgb=3'b100; else rgb=3'b000; end                                                                                                     
                     4'b0011:begin if((x>=11'd550)&&(x<=11'd700)) rgb=3'b001; else if((x>=11'd400)&&(x<=11'd550)) rgb=3'b010; else rgb=3'b000; end                                                                                                     
                     4'b1101:begin if((x>=11'd550)&&(x<=11'd700)) rgb=3'b001; else if((x>=11'd250)&&(x<=11'd400)) rgb=3'b100; else if((x>=11'd100)&&(x<=11'd250)) rgb=3'b110; else rgb=3'b000; end                                                     
                     4'b1011:begin if((x>=11'd550)&&(x<=11'd700)) rgb=3'b001; else if((x>=11'd100)&&(x<=11'd250)) rgb=3'b110; else if((x>=11'd400)&&(x<=11'd550)) rgb=3'b010; else rgb=3'b000; end                                                     
                     4'b0111:begin if((x>=11'd550)&&(x<=11'd700)) rgb=3'b001; else if((x>=11'd400)&&(x<=11'd550)) rgb=3'b010; else if((x>=11'd250)&&(x<=11'd400)) rgb=3'b100; else rgb=3'b000;end                                                      
                     4'b0000:rgb=3'b000;
                     endcase                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
           else if((y>=(y1+240))&&(y<=(y2+240)))  //fifth line                                                                                                                                                                                                       
              case(sw[23:20])                                                                                                                                                                                                                              
              4'b1000:if((x>=11'd100)&&(x<=11'd250)) rgb=3'b110; else rgb=3'b000;                                                                                                                                                                   
              4'b0100:if((x>=11'd250)&&(x<=11'd400)) rgb=3'b100; else rgb=3'b000;                                                                                                                                                                   
              4'b0010:if((x>=11'd400)&&(x<=11'd550)) rgb=3'b010; else rgb=3'b000;                                                                                                                                                                   
              4'b0001:if((x>=11'd550)&&(x<=11'd700)) rgb=3'b001; else rgb=3'b000;                                                                                                                                                                   
              4'b1100:begin if((x>=11'd100)&&(x<=11'd250)) rgb=3'b110; else if((x>=11'd250)&&(x<=11'd400)) rgb=3'b100; else rgb=3'b000; end                                                                                                         
              4'b1110:begin if((x>=11'd100)&&(x<=11'd250)) rgb=3'b110; else if((x>=11'd250)&&(x<=11'd400)) rgb=3'b100; else if((x>=11'd400)&&(x<=11'd550)) rgb=3'b010; else rgb=3'b000; end                                                         
              4'b1111:begin if((x>=11'd100)&&(x<=11'd250)) rgb=3'b110; else if((x>=11'd250)&&(x<=11'd400)) rgb=3'b100; else if((x>=11'd400)&&(x<=11'd550)) rgb=3'b010;else if((x>=11'd550)&&(x<=11'd700)) rgb=3'b001; else rgb=3'b000; end          
              4'b1010:begin if((x>=11'd400)&&(x<=11'd550)) rgb=3'b010; else if((x>=11'd100)&&(x<=11'd250)) rgb=3'b110; else rgb=3'b000; end                                                                                                         
              4'b0110:begin if((x>=11'd250)&&(x<=11'd400)) rgb=3'b100; else if((x>=11'd400)&&(x<=11'd550)) rgb=3'b010; else rgb=3'b000; end                                                                                                         
              4'b1001:begin if((x>=11'd550)&&(x<=11'd700)) rgb=3'b001; else if((x>=11'd100)&&(x<=11'd250)) rgb=3'b110; else rgb=3'b000; end                                                                                                         
              4'b0101:begin if((x>=11'd550)&&(x<=11'd700)) rgb=3'b001; else if((x>=11'd250)&&(x<=11'd400)) rgb=3'b100; else rgb=3'b000; end                                                                                                         
              4'b0011:begin if((x>=11'd550)&&(x<=11'd700)) rgb=3'b001; else if((x>=11'd400)&&(x<=11'd550)) rgb=3'b010; else rgb=3'b000; end                                                                                                         
              4'b1101:begin if((x>=11'd550)&&(x<=11'd700)) rgb=3'b001; else if((x>=11'd250)&&(x<=11'd400)) rgb=3'b100; else if((x>=11'd100)&&(x<=11'd250)) rgb=3'b110; else rgb=3'b000; end                                                         
              4'b1011:begin if((x>=11'd550)&&(x<=11'd700)) rgb=3'b001; else if((x>=11'd100)&&(x<=11'd250)) rgb=3'b110; else if((x>=11'd400)&&(x<=11'd550)) rgb=3'b010; else rgb=3'b000; end                                                         
              4'b0111:begin if((x>=11'd550)&&(x<=11'd700)) rgb=3'b001; else if((x>=11'd400)&&(x<=11'd550)) rgb=3'b010; else if((x>=11'd250)&&(x<=11'd400)) rgb=3'b100; else rgb=3'b000;end                                                          
              4'b0000:rgb=3'b000;
              endcase                                                                                                                                                                                                                               
           else if((y>=(y1+300))&&(y<=(y2+300))) //sixth line                                                                                                                                                                                                        
               case(sw[19:16])                                                                                                                                                                                                                              
               4'b1000:if((x>=11'd100)&&(x<=11'd250)) rgb=3'b110; else rgb=3'b000;                                                                                                                                                                   
               4'b0100:if((x>=11'd250)&&(x<=11'd400)) rgb=3'b100; else rgb=3'b000;                                                                                                                                                                   
               4'b0010:if((x>=11'd400)&&(x<=11'd550)) rgb=3'b010; else rgb=3'b000;                                                                                                                                                                   
               4'b0001:if((x>=11'd550)&&(x<=11'd700)) rgb=3'b001; else rgb=3'b000;                                                                                                                                                                   
               4'b1100:begin if((x>=11'd100)&&(x<=11'd250)) rgb=3'b110; else if((x>=11'd250)&&(x<=11'd400)) rgb=3'b100; else rgb=3'b000; end                                                                                                     
               4'b1110:begin if((x>=11'd100)&&(x<=11'd250)) rgb=3'b110; else if((x>=11'd250)&&(x<=11'd400)) rgb=3'b100; else if((x>=11'd400)&&(x<=11'd550)) rgb=3'b010; else rgb=3'b000; end                                                     
               4'b1111:begin if((x>=11'd100)&&(x<=11'd250)) rgb=3'b110; else if((x>=11'd250)&&(x<=11'd400)) rgb=3'b100; else if((x>=11'd400)&&(x<=11'd550)) rgb=3'b010;else if((x>=11'd550)&&(x<=11'd700)) rgb=3'b001; else rgb=3'b000; end      
               4'b1010:begin if((x>=11'd400)&&(x<=11'd550)) rgb=3'b010; else if((x>=11'd100)&&(x<=11'd250)) rgb=3'b110; else rgb=3'b000; end                                                                                                     
               4'b0110:begin if((x>=11'd250)&&(x<=11'd400)) rgb=3'b100; else if((x>=11'd400)&&(x<=11'd550)) rgb=3'b010; else rgb=3'b000; end                                                                                                     
               4'b1001:begin if((x>=11'd550)&&(x<=11'd700)) rgb=3'b001; else if((x>=11'd100)&&(x<=11'd250)) rgb=3'b110; else rgb=3'b000; end                                                                                                     
               4'b0101:begin if((x>=11'd550)&&(x<=11'd700)) rgb=3'b001; else if((x>=11'd250)&&(x<=11'd400)) rgb=3'b100; else rgb=3'b000; end                                                                                                     
               4'b0011:begin if((x>=11'd550)&&(x<=11'd700)) rgb=3'b001; else if((x>=11'd400)&&(x<=11'd550)) rgb=3'b010; else rgb=3'b000; end                                                                                                     
               4'b1101:begin if((x>=11'd550)&&(x<=11'd700)) rgb=3'b001; else if((x>=11'd250)&&(x<=11'd400)) rgb=3'b100; else if((x>=11'd100)&&(x<=11'd250)) rgb=3'b110; else rgb=3'b000; end                                                     
               4'b1011:begin if((x>=11'd550)&&(x<=11'd700)) rgb=3'b001; else if((x>=11'd100)&&(x<=11'd250)) rgb=3'b110; else if((x>=11'd400)&&(x<=11'd550)) rgb=3'b010; else rgb=3'b000; end                                                     
               4'b0111:begin if((x>=11'd550)&&(x<=11'd700)) rgb=3'b001; else if((x>=11'd400)&&(x<=11'd550)) rgb=3'b010; else if((x>=11'd250)&&(x<=11'd400)) rgb=3'b100; else rgb=3'b000;end                                                      
               4'b0000:rgb=3'b000;
               endcase                                                                                                                                                                                                                               
            else if((y>=(y1+360))&&(y<=(y2+360)))    //seven line                                                                                                                                                                                                     
               case(sw[15:12])                                                                                                                                                                                                                              
               4'b1000:if((x>=11'd100)&&(x<=11'd250)) rgb=3'b110; else rgb=3'b000;                                                                                                                                                                   
               4'b0100:if((x>=11'd250)&&(x<=11'd400)) rgb=3'b100; else rgb=3'b000;                                                                                                                                                                   
               4'b0010:if((x>=11'd400)&&(x<=11'd550)) rgb=3'b010; else rgb=3'b000;                                                                                                                                                                   
               4'b0001:if((x>=11'd550)&&(x<=11'd700)) rgb=3'b001; else rgb=3'b000;                                                                                                                                                                   
               4'b1100:begin if((x>=11'd100)&&(x<=11'd250)) rgb=3'b110; else if((x>=11'd250)&&(x<=11'd400)) rgb=3'b100; else rgb=3'b000; end                                                                                                           
               4'b1110:begin if((x>=11'd100)&&(x<=11'd250)) rgb=3'b110; else if((x>=11'd250)&&(x<=11'd400)) rgb=3'b100; else if((x>=11'd400)&&(x<=11'd550)) rgb=3'b010; else rgb=3'b000; end                                                           
               4'b1111:begin if((x>=11'd100)&&(x<=11'd250)) rgb=3'b110; else if((x>=11'd250)&&(x<=11'd400)) rgb=3'b100; else if((x>=11'd400)&&(x<=11'd550)) rgb=3'b010;else if((x>=11'd550)&&(x<=11'd700)) rgb=3'b001; else rgb=3'b000; end            
               4'b1010:begin if((x>=11'd400)&&(x<=11'd550)) rgb=3'b010; else if((x>=11'd100)&&(x<=11'd250)) rgb=3'b110; else rgb=3'b000; end                                                                                                           
               4'b0110:begin if((x>=11'd250)&&(x<=11'd400)) rgb=3'b100; else if((x>=11'd400)&&(x<=11'd550)) rgb=3'b010; else rgb=3'b000; end                                                                                                           
               4'b1001:begin if((x>=11'd550)&&(x<=11'd700)) rgb=3'b001; else if((x>=11'd100)&&(x<=11'd250)) rgb=3'b110; else rgb=3'b000; end                                                                                                           
               4'b0101:begin if((x>=11'd550)&&(x<=11'd700)) rgb=3'b001; else if((x>=11'd250)&&(x<=11'd400)) rgb=3'b100; else rgb=3'b000; end                                                                                                           
               4'b0011:begin if((x>=11'd550)&&(x<=11'd700)) rgb=3'b001; else if((x>=11'd400)&&(x<=11'd550)) rgb=3'b010; else rgb=3'b000; end                                                                                                           
               4'b1101:begin if((x>=11'd550)&&(x<=11'd700)) rgb=3'b001; else if((x>=11'd250)&&(x<=11'd400)) rgb=3'b100; else if((x>=11'd100)&&(x<=11'd250)) rgb=3'b110; else rgb=3'b000; end                                                           
               4'b1011:begin if((x>=11'd550)&&(x<=11'd700)) rgb=3'b001; else if((x>=11'd100)&&(x<=11'd250)) rgb=3'b110; else if((x>=11'd400)&&(x<=11'd550)) rgb=3'b010; else rgb=3'b000; end                                                           
               4'b0111:begin if((x>=11'd550)&&(x<=11'd700)) rgb=3'b001; else if((x>=11'd400)&&(x<=11'd550)) rgb=3'b010; else if((x>=11'd250)&&(x<=11'd400)) rgb=3'b100; else rgb=3'b000;end                                                            
               4'b0000:rgb=3'b000;
               endcase                                                                                                                                                                                                                               
           else if((y>=(y1+420))&&(y<=(y2+420)))   //eightth line                                                                                                                                                                                                      
                case(sw[11:8])                                                                                                                                                                                                                              
                4'b1000:if((x>=11'd100)&&(x<=11'd250)) rgb=3'b110; else rgb=3'b000;                                                                                                                                                                   
                4'b0100:if((x>=11'd250)&&(x<=11'd400)) rgb=3'b100; else rgb=3'b000;                                                                                                                                                                   
                4'b0010:if((x>=11'd400)&&(x<=11'd550)) rgb=3'b010; else rgb=3'b000;                                                                                                                                                                   
                4'b0001:if((x>=11'd550)&&(x<=11'd700)) rgb=3'b001; else rgb=3'b000;                                                                                                                                                                   
                4'b1100:begin if((x>=11'd100)&&(x<=11'd250)) rgb=3'b110; else if((x>=11'd250)&&(x<=11'd400)) rgb=3'b100; else rgb=3'b000; end                                                                                                           
                4'b1110:begin if((x>=11'd100)&&(x<=11'd250)) rgb=3'b110; else if((x>=11'd250)&&(x<=11'd400)) rgb=3'b100; else if((x>=11'd400)&&(x<=11'd550)) rgb=3'b010; else rgb=3'b000; end                                                           
                4'b1111:begin if((x>=11'd100)&&(x<=11'd250)) rgb=3'b110; else if((x>=11'd250)&&(x<=11'd400)) rgb=3'b100; else if((x>=11'd400)&&(x<=11'd550)) rgb=3'b010;else if((x>=11'd550)&&(x<=11'd700)) rgb=3'b001; else rgb=3'b000; end            
                4'b1010:begin if((x>=11'd400)&&(x<=11'd550)) rgb=3'b010; else if((x>=11'd100)&&(x<=11'd250)) rgb=3'b110; else rgb=3'b000; end                                                                                                           
                4'b0110:begin if((x>=11'd250)&&(x<=11'd400)) rgb=3'b100; else if((x>=11'd400)&&(x<=11'd550)) rgb=3'b010; else rgb=3'b000; end                                                                                                           
                4'b1001:begin if((x>=11'd550)&&(x<=11'd700)) rgb=3'b001; else if((x>=11'd100)&&(x<=11'd250)) rgb=3'b110; else rgb=3'b000; end                                                                                                           
                4'b0101:begin if((x>=11'd550)&&(x<=11'd700)) rgb=3'b001; else if((x>=11'd250)&&(x<=11'd400)) rgb=3'b100; else rgb=3'b000; end                                                                                                           
                4'b0011:begin if((x>=11'd550)&&(x<=11'd700)) rgb=3'b001; else if((x>=11'd400)&&(x<=11'd550)) rgb=3'b010; else rgb=3'b000; end                                                                                                           
                4'b1101:begin if((x>=11'd550)&&(x<=11'd700)) rgb=3'b001; else if((x>=11'd250)&&(x<=11'd400)) rgb=3'b100; else if((x>=11'd100)&&(x<=11'd250)) rgb=3'b110; else rgb=3'b000; end                                                           
                4'b1011:begin if((x>=11'd550)&&(x<=11'd700)) rgb=3'b001; else if((x>=11'd100)&&(x<=11'd250)) rgb=3'b110; else if((x>=11'd400)&&(x<=11'd550)) rgb=3'b010; else rgb=3'b000; end                                                           
                4'b0111:begin if((x>=11'd550)&&(x<=11'd700)) rgb=3'b001; else if((x>=11'd400)&&(x<=11'd550)) rgb=3'b010; else if((x>=11'd250)&&(x<=11'd400)) rgb=3'b100; else rgb=3'b000;end                                                            
                4'b0000:rgb=3'b000;
                endcase                                                                                                                                                                                                                               
           else if((y>=(y1+480))&&(y<=(y2+480)))  //nineth line                                                                                                                                                                                                       
                 case(sw[7:4])                                                                                                                                                                                                                              
                 4'b1000:if((x>=11'd100)&&(x<=11'd250)) rgb=3'b110; else rgb=3'b000;                                                                                                                                                                   
                 4'b0100:if((x>=11'd250)&&(x<=11'd400)) rgb=3'b100; else rgb=3'b000;                                                                                                                                                                   
                 4'b0010:if((x>=11'd400)&&(x<=11'd550)) rgb=3'b010; else rgb=3'b000;                                                                                                                                                                   
                 4'b0001:if((x>=11'd550)&&(x<=11'd700)) rgb=3'b001; else rgb=3'b000;                                                                                                                                                                   
                 4'b1100:begin if((x>=11'd100)&&(x<=11'd250)) rgb=3'b110; else if((x>=11'd250)&&(x<=11'd400)) rgb=3'b100; else rgb=3'b000; end                                                                                                          
                 4'b1110:begin if((x>=11'd100)&&(x<=11'd250)) rgb=3'b110; else if((x>=11'd250)&&(x<=11'd400)) rgb=3'b100; else if((x>=11'd400)&&(x<=11'd550)) rgb=3'b010; else rgb=3'b000; end                                                          
                 4'b1111:begin if((x>=11'd100)&&(x<=11'd250)) rgb=3'b110; else if((x>=11'd250)&&(x<=11'd400)) rgb=3'b100; else if((x>=11'd400)&&(x<=11'd550)) rgb=3'b010;else if((x>=11'd550)&&(x<=11'd700)) rgb=3'b001; else rgb=3'b000; end           
                 4'b1010:begin if((x>=11'd400)&&(x<=11'd550)) rgb=3'b010; else if((x>=11'd100)&&(x<=11'd250)) rgb=3'b110; else rgb=3'b000; end                                                                                                          
                 4'b0110:begin if((x>=11'd250)&&(x<=11'd400)) rgb=3'b100; else if((x>=11'd400)&&(x<=11'd550)) rgb=3'b010; else rgb=3'b000; end                                                                                                          
                 4'b1001:begin if((x>=11'd550)&&(x<=11'd700)) rgb=3'b001; else if((x>=11'd100)&&(x<=11'd250)) rgb=3'b110; else rgb=3'b000; end                                                                                                          
                 4'b0101:begin if((x>=11'd550)&&(x<=11'd700)) rgb=3'b001; else if((x>=11'd250)&&(x<=11'd400)) rgb=3'b100; else rgb=3'b000; end                                                                                                          
                 4'b0011:begin if((x>=11'd550)&&(x<=11'd700)) rgb=3'b001; else if((x>=11'd400)&&(x<=11'd550)) rgb=3'b010; else rgb=3'b000; end                                                                                                          
                 4'b1101:begin if((x>=11'd550)&&(x<=11'd700)) rgb=3'b001; else if((x>=11'd250)&&(x<=11'd400)) rgb=3'b100; else if((x>=11'd100)&&(x<=11'd250)) rgb=3'b110; else rgb=3'b000; end                                                          
                 4'b1011:begin if((x>=11'd550)&&(x<=11'd700)) rgb=3'b001; else if((x>=11'd100)&&(x<=11'd250)) rgb=3'b110; else if((x>=11'd400)&&(x<=11'd550)) rgb=3'b010; else rgb=3'b000; end                                                          
                 4'b0111:begin if((x>=11'd550)&&(x<=11'd700)) rgb=3'b001; else if((x>=11'd400)&&(x<=11'd550)) rgb=3'b010; else if((x>=11'd250)&&(x<=11'd400)) rgb=3'b100; else rgb=3'b000;end                                                           
                 4'b0000:rgb=3'b000;
                 endcase
           else if((y>=(y1+484))&&(y<=(y2+486))) //wihite line before the last line of screen which is the playing zone
                        rgb=3'b111;
                                                                                                                                                                                                                         
           else if((y>=(y1+540))&&(y<=(y2+540)))  //tenth line                                                                                                                                                                                                        
                 case(sw[3:0])                                                                                                                                                                                                                                                                                                                                                                                                                                                           
                 4'b1000:if((x>=11'd100)&&(x<=11'd250)) rgb=3'b110; else rgb=3'b000;                                                                                                                                                                   
                 4'b0100:if((x>=11'd250)&&(x<=11'd400)) rgb=3'b100; else rgb=3'b000;                                                                                                                                                                   
                 4'b0010:if((x>=11'd400)&&(x<=11'd550)) rgb=3'b010; else rgb=3'b000;                                                                                                                                                                   
                 4'b0001:if((x>=11'd550)&&(x<=11'd700)) rgb=3'b001; else rgb=3'b000;                                                                                                                                                                   
                 4'b1100:begin if((x>=11'd100)&&(x<=11'd250)) rgb=3'b110; else if((x>=11'd250)&&(x<=11'd400)) rgb=3'b100; else rgb=3'b000; end                                                                                                         
                 4'b1110:begin if((x>=11'd100)&&(x<=11'd250)) rgb=3'b110; else if((x>=11'd250)&&(x<=11'd400)) rgb=3'b100; else if((x>=11'd400)&&(x<=11'd550)) rgb=3'b010; else rgb=3'b000; end                                                         
                 4'b1111:begin if((x>=11'd100)&&(x<=11'd250)) rgb=3'b110; else if((x>=11'd250)&&(x<=11'd400)) rgb=3'b100; else if((x>=11'd400)&&(x<=11'd550)) rgb=3'b010;else if((x>=11'd550)&&(x<=11'd700)) rgb=3'b001; else rgb=3'b000; end          
                 4'b1010:begin if((x>=11'd400)&&(x<=11'd550)) rgb=3'b010; else if((x>=11'd100)&&(x<=11'd250)) rgb=3'b110; else rgb=3'b000; end                                                                                                         
                 4'b0110:begin if((x>=11'd250)&&(x<=11'd400)) rgb=3'b100; else if((x>=11'd400)&&(x<=11'd550)) rgb=3'b010; else rgb=3'b000; end                                                                                                         
                 4'b1001:begin if((x>=11'd550)&&(x<=11'd700)) rgb=3'b001; else if((x>=11'd100)&&(x<=11'd250)) rgb=3'b110; else rgb=3'b000; end                                                                                                         
                 4'b0101:begin if((x>=11'd550)&&(x<=11'd700)) rgb=3'b001; else if((x>=11'd250)&&(x<=11'd400)) rgb=3'b100; else rgb=3'b000; end                                                                                                         
                 4'b0011:begin if((x>=11'd550)&&(x<=11'd700)) rgb=3'b001; else if((x>=11'd400)&&(x<=11'd550)) rgb=3'b010; else rgb=3'b000; end                                                                                                         
                 4'b1101:begin if((x>=11'd550)&&(x<=11'd700)) rgb=3'b001; else if((x>=11'd250)&&(x<=11'd400)) rgb=3'b100; else if((x>=11'd100)&&(x<=11'd250)) rgb=3'b110; else rgb=3'b000; end                                                         
                 4'b1011:begin if((x>=11'd550)&&(x<=11'd700)) rgb=3'b001; else if((x>=11'd100)&&(x<=11'd250)) rgb=3'b110; else if((x>=11'd400)&&(x<=11'd550)) rgb=3'b010; else rgb=3'b000; end                                                         
                 4'b0111:begin if((x>=11'd550)&&(x<=11'd700)) rgb=3'b001; else if((x>=11'd400)&&(x<=11'd550)) rgb=3'b010; else if((x>=11'd250)&&(x<=11'd400)) rgb=3'b100; else rgb=3'b000;end                                                          
                 4'b0000:rgb=3'b111; //sides of playing zoen is white for recognition
                 endcase                                                                                                                                                                                                           
            else                                                                                                                                                                                    
               rgb=3'b000;                                                                                                                                                                          
      end  
      assign red_out[0]      = rgb[2]; //assigning outputs for each four port of basys 
      assign red_out[1]      = rgb[2];
      assign red_out[2]      = rgb[2];
      assign red_out[3]      = rgb[2];
      assign green_out[0]    = rgb[1];
      assign green_out[1]    = rgb[1];
      assign green_out[2]    = rgb[1];
      assign green_out[3]    = rgb[1];
      assign blue_out[0]     = rgb[0];
      assign blue_out[1]     = rgb[0];
      assign blue_out[2]     = rgb[0];
      assign blue_out[3]     = rgb[0];
      

   
   
endmodule // color