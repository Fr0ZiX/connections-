`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/04/2026 05:59:57 PM
// Design Name: 
// Module Name: coretop4k
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


module coretop4k(
    input logic clk, rst
    );
    import const_pkg::*;
    //чтение
    logic we1, we2, we3;
    logic [4:0]we1_addr, we2_addr, we3_addr;
    logic [XLEN-1:0] d_n1, d_n2, d_n3;
    //запись
    logic [4:0]rd1_addr, rd2_addr, rd3_addr, rd4_addr, rd5_addr, rd6_addr;
    logic [XLEN-1:0]q_o1, q_o2, q_o3, q_o4, q_o5, q_o6;
    register_file #(
      .XLEN(XLEN)
      ) rf_inst(
        .clk  (clk),
        .rst  (rst),
        //WRITE
        .we1  (we1),
        .we2  (we2),
        .we3  (we3),
        .d_n1 (d_n1),
        .d_n2 (d_n2),
        .d_n3 (d_n3),
        .we1_addr (we1_addr),
        .we2_addr (we2_addr),
        .we3_addr (we3_addr),
        //READ  
        .q_o1   (q_01),
        .q_o2   (q_o2),
        .q_o3   (q_o3),
        .q_o4   (q_o4),
        .q_o5   (q_o5),
        .q_o6   (q_o6),
        .rd1_addr (rd1_addr),
        .rd2_addr (rd2_addr),
        .rd3_addr (rd3_addr),
        .rd4_addr (rd4_addr),
        .rd5_addr (rd5_addr),
        .rd6_addr (rd6_addr)
        
        );   
        
    
endmodule
