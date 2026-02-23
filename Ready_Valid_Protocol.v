//top module

module top_moduler(
    input clk,
    input rst
);

wire valid;
wire ready;
wire [7:0] data;

valid_ready u1 (
    .clk(clk),
    .rst(rst),
    .ready(ready),
    .valid(valid),
    .data(data)
);

valid_ready_r u2 (
    .clk(clk),
    .rst(rst),
    .valid(valid),
    .data(data),
    .ready(ready)
);

endmodule


//sender

module valid_ready(

    input clk,
    input rst,
    input ready,
    output reg valid,
    output reg [7:0] data
);

always @(posedge clk or posedge rst) begin
    if (rst) begin
        valid <= 0;
        data  <= 0;   // fixed data
    end
    else begin
     valid <= 1;   
     if(valid&&ready)
         data <= data+1;
   end
end
endmodule

//receiver
module valid_ready_r(

    input clk,
    input rst,
    input valid,
    input [7:0] data,
    output reg ready
);

always @(posedge clk or posedge rst) begin
    if (rst)
        ready <= 0;
    else
        ready <= ~ready;  // toggle ready every clock
end
endmodule


