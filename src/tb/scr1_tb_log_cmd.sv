module scr1_tb_log_cmd();

always_ff @(posedge scr1_top_tb_ahb.i_top.i_imem_ahb.clk) begin
    if (scr1_top_tb_ahb.i_top.i_imem_ahb.imem_resp == 2'b01) begin
        // valid data from ahb router
        if (
            (scr1_top_tb_ahb.i_top.i_imem_ahb.imem_rdata[6 : 0] == 7'b0110011) &
            (scr1_top_tb_ahb.i_top.i_imem_ahb.imem_rdata[14 : 12] == 3'b110)
        ) begin
            // detect or command
            $display("Detect OR command, pc counter: %h", scr1_top_tb_ahb.i_top.i_core_top.i_pipe_top.curr_pc[31 : 0]);
        end
    end
end

endmodule