module tt_um_bulls_and_cows (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,
    input  wire       clk,
    input  wire       rst_n
);

assign uio_oe = 0;
assign uio_out= 0;

reg save_reg_1;
reg save_reg_2;

always @(posedge clk) begin
    if(!rst_n) begin
        save_reg_1<=0;
        save_reg_2<=0;
    end
    else begin
        save_reg_1<=ui_in[6];
        save_reg_2<=save_reg_1;
    end
end

wire save;
assign save=(~save_reg_2) & save_reg_1;

top_bulls_and_cows tt_b_c(.clk(clk),
                         .rst_n(rst_n),
                         .inpA(ui_in[2:0]),
                         .inpB(ui_in[5:3]),
                         .inpC(uio_in[2:0]),
                         .inpD(uio_in[5:3]),
                         .save(save),
                         .segment_out(uo_out));

endmodule