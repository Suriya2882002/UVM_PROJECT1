`ifndef master_agt_top
`define master_agt_top
class master_agt_top extends uvm_agent;
`uvm_component_utils(master_agt_top)

master_agent magt[];
environment_config ecfg;
virtual i2c_intf vif;

//---------------------------------------------
// Externally defined tasks and functions
//---------------------------------------------


extern function new(string name="master_agt_top",uvm_component parent);
extern function void build_phase(uvm_phase phase);
endclass

//-----------------------------------------------------------------------------
// Constructor: new
// Initializes the master_agt_top class object
//
// Parameters:
//  name   - instance name of the master_agt_top
//  parent - parent under which this component is created
//-----------------------------------------------------------------------------


function master_agt_top::new(string name="master_agt_top",uvm_component parent);
	super.new(name,parent);
endfunction


//-----------------------------------------------------------------------------
// Function: build_phase
// Creates the master_agent components 
//
// Parameters:
//  phase - stores the current phase 
//-----------------------------------------------------------------------------


function void master_agt_top::build_phase(uvm_phase phase);
if(!uvm_config_db#(environment_config)::get(this,"","ENVIRONMENT_CONFIG",ecfg))
  `uvm_error("MASTETR_AGT_TOP","couldnt get")
   
magt=new[ecfg.no_of_magent];

foreach(magt[i])
 begin
  magt[i]=master_agent::type_id::create($sformatf("magt[%0d]",i),this);
   uvm_config_db#(master_agent_config)::set(this,"*","MASTER_AGENT_CONFIG",ecfg.mcfg[i]);
 end
endfunction

`endif
