`default_nettype none
`include "cpu.v"
module top(input rst, 
           input instr_we, 
           input [7:0] cpu_fill, 
           output [1:0] cpu_out,
           output [2:0] RGB);

    wire clk;
    reg [31:0] counter;

    assign RGB[0] = ~counter[26];
    assign RGB[1] = ~counter[27];
    assign RGB[2] = ~counter[28];
    //10khz used for low power applications (or sleep mode)
    SB_HFOSC SB_HFOSC_inst(
        .CLKHFEN(1),
        .CLKHFPU(1),
        .CLKHF(clk)
    );

    cpu cpu_init(.clk(counter[26]),
                 .rst(rst),
                 .cpu_out(cpu_out),
                 .data_in(cpu_fill),
                 .instr_we(instr_we));

    always @(posedge clk) begin 
        if (rst) begin 
            counter <= 0;
        end
        counter <= counter + 1;
    end

endmodule