class slave_xtn extends uvm_sequence_item;
`uvm_object_utils(slave_xtn)


//---------------------------------------------
// Externally defined tasks and functions
//---------------------------------------------


extern function new(string name="slave_xtn");

endclass

//-----------------------------------------------------------------------------
// Constructor: new
// Initializes the slave_xtn class object
//
// Parameters:
//  name   - instance name of the slave_xtn
//-----------------------------------------------------------------------------


function slave_xtn::new(string name="slave_xtn");
	super.new(name);
endfunction
