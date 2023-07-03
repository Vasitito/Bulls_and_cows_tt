module b_c(inpA,inpB,inpC,inpD,secret_number_A,secret_number_B,secret_number_C,secret_number_D,save,bulls,cows);
    input [2:0] inpA;
    input [2:0] inpB;
    input [2:0] inpC;
    input [2:0] inpD;
    input [2:0] secret_number_A;
    input [2:0] secret_number_B;
    input [2:0] secret_number_C;
    input [2:0] secret_number_D;
    input save;
    output [3:0] bulls;
    output [3:0] cows;

    wire bull_a;
    wire bull_b;
    wire bull_c;
    wire bull_d;

    wire cow_a;
    wire cow_b;
    wire cow_c;
    wire cow_d;

    assign bull_a=(inpA==secret_number_A & ~save);
    assign bull_b=(inpB==secret_number_B & ~save);
    assign bull_c=(inpC==secret_number_C & ~save);
    assign bull_d=(inpD==secret_number_D & ~save);

    assign cow_a=((inpA==secret_number_B || inpA==secret_number_C || inpA==secret_number_D)& ~save);
    assign cow_b=((inpB==secret_number_A || inpB==secret_number_C || inpB==secret_number_D)& ~save);
    assign cow_c=((inpC==secret_number_B || inpC==secret_number_A || inpC==secret_number_D)& ~save);
    assign cow_d=((inpD==secret_number_B || inpD==secret_number_C || inpD==secret_number_A)& ~save);
    
    assign bulls={bull_d,bull_c,bull_b,bull_a};
    assign cows={cow_d,cow_c,cow_b,cow_a};

endmodule