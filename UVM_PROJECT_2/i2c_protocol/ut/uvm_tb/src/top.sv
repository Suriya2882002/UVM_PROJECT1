module top;
  
import uvm_pkg::*;
import i2c_pkg::*; 
i2c_intf cif();
   
initial
   begin
     run_test("i2c_test");
   end
endmodule
