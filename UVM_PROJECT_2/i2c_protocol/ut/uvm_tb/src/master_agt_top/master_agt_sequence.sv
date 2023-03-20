class master_agt_sequence extends uvm_sequence#(master_xtn);
`uvm_object_utils(master_agt_sequence)


//---------------------------------------------
// Externally defined tasks and functions
//---------------------------------------------

extern function new(string name="master_agt_sequence");
extern task body;

endclass


//-----------------------------------------------------------------------------
// Constructor: new
// Initializes the master_agt_sequence class object
//
// Parameters:
//  name   - instance name of the master_agt_sequence
//-----------------------------------------------------------------------------


function master_agt_sequence::new(string name="master_agt_sequence");
	super.new(name);
endfunction


//-----------------------------------------------------------------------------
// Task: body
// master_xtn is randomized to get differnet test stimulus
//-----------------------------------------------------------------------------

task master_agt_sequence::body;
     req=master_xtn::type_id::create("req");
     
     start_item(req);
       assert(req.randomize());
     finish_item(req);
    
endtask
