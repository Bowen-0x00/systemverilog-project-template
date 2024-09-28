module test_sva();
    parameter PERIOD = 20;
    reg a;
    reg b;

    reg clk;
    initial begin
        clk <= 0;
        forever #(PERIOD/2) clk <= !clk;
    end

    always @(posedge clk) begin
        assert (a && b) 
            $display("SUCCESS!");
        else   $error("assertion");
    end
    
    initial begin
        $display("xiba");
        a <= 0;
        b <= 0;
        #(PERIOD)
        a <= 1;
        b <= 1;
        #(PERIOD)
        a <= 1;
        b <= 0;
        #(PERIOD)
        a <= 0;
        b <= 1;
        #(PERIOD)
        a <= 0;
        b <= 0;
        #(PERIOD)
        a <= 1;
        b <= 1;
        #(PERIOD*5)
        $finish;
    end
    
endmodule //test_sva
