`default_nettype none

module mem(input wire clk,
           input wire we, 
           input wire [3:0] addr, 
           input wire [1:0] d_in, 
           output reg [1:0] d_out);

    reg [1:0] mem [0:15];

    always @(posedge clk) begin 

        if (we) begin 
            mem[addr] <= d_in;
            d_out <= mem[addr];
        end
        else begin 
            d_out <= mem[addr];
        end
    end

endmodule