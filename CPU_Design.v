`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Mohammad Musawer
// 
// Create Date: 08/05/2021 02:40:10 PM
// Project Name: Central Processing Unit Design in Verilog
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

// Half adder module
module half_adder(

    input A, B,
    output sum, carry
    
    );

    xor x0(sum, A, B);
    and a0(carry, A, B);

endmodule

// Full adder module
module full_adder(

    input A, B, Cin,
    output sum, carry

    );
    
    wire ha0_sum, ha0_carry;
    wire ha1_sum, ha1_carry;
   
    // Using half adder module
    half_adder ha0(A, B, ha0_sum, ha0_carry);
    half_adder ha1(ha0_sum, Cin, ha1_sum, ha1_carry);

    or or0(carry, ha0_carry, ha1_carry);
    assign sum = ha1_sum;

endmodule

// 8-bit ripple carry adder module
module ripplecarry_adder_8bit(

    input [7:0] A, B,
    input Cin,
    output [7:0] sum,
    output cout

    );

    // Wire for each full adder's carry bit
    wire [7:0] full_adder_cout;   

    // Using full adder module
    full_adder fa0(A[0], B[0], Cin, sum[0], full_adder_cout[0]);
    full_adder fa1(A[1], B[1], full_adder_cout[0], sum[1], full_adder_cout[1]);
    full_adder fa2(A[2], B[2], full_adder_cout[1], sum[2], full_adder_cout[2]);
    full_adder fa3(A[3], B[3], full_adder_cout[2], sum[3], full_adder_cout[3]);
    full_adder fa4(A[4], B[4], full_adder_cout[3], sum[4], full_adder_cout[4]);
    full_adder fa5(A[5], B[5], full_adder_cout[4], sum[5], full_adder_cout[5]);
    full_adder fa6(A[6], B[6], full_adder_cout[5], sum[6], full_adder_cout[6]);
    full_adder fa7(A[7], B[7], full_adder_cout[6], sum[7], cout);
    
endmodule

/////////////////////////////////////////////////////////////////////////////////

module control_unit(

    );
endmodule


module ALU(

    );
endmodule


module RAM(

    );
endmodule


module register(

    );
endmodule
