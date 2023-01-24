module seqdet(in,clk,rst,out);
input in,clk,rst;
output reg out;
reg [3:0]state,next_state;
parameter S0=4'b0000,S1=4'b0001,S2=4'b0010,S3=4'b0011,S4=4'b0100;
always @(posedge clk or posedge rst)
begin
if (rst)
state<=S0;
else
state<=next_state;
end 

//detects 0111 sequence

always @(*)
begin
case(state)
S0: begin if (in==1'b0) next_state=S1;
    else next_state=S0;
    out<=1'b0; end
S1: begin if (in==1'b1) next_state<=S2;
    else next_state<=S0;
    out<=1'b0; end
S2: begin if (in==1'b1) next_state<=S3;
    else next_state<=S0;
    out<=1'b0; end
S3: begin if (in==1'b1) next_state<=S4;
    else next_state<=S0;
    out<=1'b0; end
S4: begin if (in==1'b1) next_state<=S0;
    else next_state<=S1;
    out<=1'b1; end
default: begin next_state<=S0;
         out<=1'b0; end 
endcase               
end      
endmodule