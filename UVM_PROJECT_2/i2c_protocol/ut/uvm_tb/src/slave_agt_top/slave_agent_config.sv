class slave_agent_config extends uvm_object;
	`uvm_object_utils(slave_agent_config)
          virtual i2c_intf vif;
uvm_active_passive_enum is_active=UVM_ACTIVE;  


//---------------------------------------------
// Externally defined tasks and functions
//---------------------------------------------

function new(string name = "slave_agent_config");
		super.new(name);
	endfunction
//extern function new (string name = "slave_agent_config");
endclass: slave_agent_config


//-----------------------------------------------------------------------------
// Constructor: new
// Initializes the slave_agent_config class object
//
// Parameters:
//  name   - instance name of the slave_agent_config
//-----------------------------------------------------------------------------




