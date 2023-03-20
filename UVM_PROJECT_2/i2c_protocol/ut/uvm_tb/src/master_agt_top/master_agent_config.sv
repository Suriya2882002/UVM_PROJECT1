`ifndef master_agent_config
`define master_agent_config

class master_agent_config extends uvm_object;
  `uvm_object_utils(master_agent_config)
   virtual i2c_intf vif;
   uvm_active_passive_enum is_active=UVM_ACTIVE;  
	
  //Each master can decide its own frequenecy of operation based on this value
   int clk_period=10;
   int no_of_data_item = 8;


//---------------------------------------------
// Externally defined tasks and functions
//---------------------------------------------

extern function new (string name = "master_agent_config");
endclass: master_agent_config


//-----------------------------------------------------------------------------
// Constructor: new
// Initializes the master_agent_config class object
//
// Parameters:
//  name   - instance name of the master_agent_config
//-----------------------------------------------------------------------------

function master_agent_config::new(string name = "master_agent_config");
		super.new(name);
endfunction: new

`endif
