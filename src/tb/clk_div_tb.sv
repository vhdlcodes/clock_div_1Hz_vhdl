///////////////////////////////////////////////////////////////////////////
//
//  Project          : Clock Divider for generating 1Hz frequency
//  File Name        : clk_div_tb.sv
//  Created By       : Prasad Pandit
//  Contact          : prasadp4009@gmail.com
//  Last Modified    : 09/16/2018
//  Revision History : 1v0
//  ------------
//  Description      : This TB generates clock and reset
//
////////////////////////////////////////////////////////////////////////////

`ifndef CLK_DIV_TB__SV
`define CLK_DIV_TB__SV

`timescale 1ns/100ps

module clk_div_tb;
  logic clk;
  logic rst_n;
  logic op;

  clk_div #(.max_count(20)) DUT (
                                    .clk(clk),
                                    .rst_n(rst_n),
                                    .op(op)
                                 );

  initial
  begin
    clk = 0;
    forever
       #5 clk = ~clk;
  end

  initial
  begin
    rst_n = 0;
    repeat(2)
      @(negedge clk);
    rst_n = 1;
    $display("Starting Test");
    #1000 $finish;
  end
endmodule : clk_div_tb

`endif

//End of clk_div_tb
