module top_bulls_and_cows(clk,rst_n,inpA,inpB,inpC,inpD,save,segment_out);
    input clk;
    input rst_n;
    input [2:0] inpA;
    input [2:0] inpB;
    input [2:0] inpC;
    input [2:0] inpD;
    input save;
    output [7:0] segment_out;

    reg [2:0] secret_number_A;
    reg [2:0] secret_number_B;
    reg [2:0] secret_number_C;
    reg [2:0] secret_number_D;

    wire [3:0] bulls;
    wire [3:0] cows;

    always @(posedge clk) begin
        if(!rst_n) begin
            secret_number_A<=0;
            secret_number_B<=0;
            secret_number_C<=0;
            secret_number_D<=0;
        end
        else begin
            if(save) begin
                secret_number_A<=inpA;
                secret_number_B<=inpB;
                secret_number_C<=inpC;
                secret_number_D<=inpD;
            end
        end
    end

    b_c bull(.inpA(inpA),
             .inpB(inpB),
             .inpC(inpC),
             .inpD(inpD),
             .secret_number_A(secret_number_A),
             .secret_number_B(secret_number_B),
             .secret_number_C(secret_number_C),
             .secret_number_D(secret_number_D),
             .save(save),
             .bulls(bulls),
             .cows(cows));

    assign segment_out={cows[3],bulls[3],bulls[0],cows[2:0],bulls[2:1]};

endmodule