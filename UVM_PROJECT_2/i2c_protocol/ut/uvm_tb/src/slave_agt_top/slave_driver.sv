class slave_driver extends uvm_driver#(slave_xtn);
`uvm_component_utils(slave_driver)

  slave_agent_config scfg;
  virtual i2c_intf vif;
  logic [6:0] slave_addr;
  logic [7:0] in_data;
  bit         ack,sda,scl;
  bit start_detected;
  event start_e, stop_e;

//---------------------------------------------
// Externally defined tasks and functions
//---------------------------------------------

extern function new(string name="slave_driver",uvm_component parent);
extern function void build_phase(uvm_phase phase);
extern function void connect_phase(uvm_phase phase);
extern task run_phase(uvm_phase phase);
extern task start_condition;
endclass


//-----------------------------------------------------------------------------
// Constructor: new
// Initializes the slave_driver class object
// Parameters:
// name   - instance name of the slave_driver
// parent - parent under which this component is created
//-----------------------------------------------------------------------------


function slave_driver::new(string name="slave_driver",uvm_component parent);
	super.new(name,parent);
endfunction:new
 

//-----------------------------------------------------------------------------
// Function: build_phase
// Creates the required ports
// Parameters:
// phase - stores the current phase 
//-----------------------------------------------------------------------------


function void slave_driver::build_phase(uvm_phase phase);
  if(!uvm_config_db#(slave_agent_config)::get(this,"","SLAVE_AGT_CONFIG",scfg))
   `uvm_fatal("slave_driver","COULDNT GET")
endfunction:build_phase



//-----------------------------------------------------------------------------
// Function: connect_phase
// Connects the slave_driver to the required interface
// Parameters:
// phase - stores the current phase 
//-----------------------------------------------------------------------------


function void slave_driver::connect_phase(uvm_phase phase);
vif=scfg.vif;
endfunction:connect_phase


//-----------------------------------------------------------------------------
// Task: run_phase
// Initiates the main Driving task 
// Parameters:
// phase - stores the current phase 
//-----------------------------------------------------------------------------

task slave_driver::run_phase(uvm_phase phase);
 
super.run_phase(phase);
 // bit slave_valid=0;
//fork
	forever
	  begin
		  start_condition();
          end

/*	forever
	  begin
		  stop_condition();
          end
join
         wait(start_e.triggered);
	 //logic to check address
	 @ (negedge scl)
         for (int i=6; i<0; i--)
	 slave_addr[i]=intf.addr;
         
         @ (negedge scl)
	 for (int j=7; j<0; j--)
         in_data[i]=*/
         
endtask:run_phase

task slave_driver::start_condition();
	@ (negedge sda)
	if (scl==1'b1)
	begin
		//if (start_detected==1)
		//phase.raise_objection(this);
	-> start_e;
	$display("start condition detection");
        end
endtask:start_condition

/*task slave_driver::stop_condition();
	@ (posedge sda)
	if (scl==1'b1)
	begin
		//if (start_detected==0)
		//phase.drop_objection(this);
	-> stop_e;
        end
endtask:stop_condition
task slave_driver::slave_ack();
	@ (negedge scl)
	sda==1'b0;
	@ (negedge scl)
	sda==1'b1;
  
endtask:slave_ack*/
