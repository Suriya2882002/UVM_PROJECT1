`ifndef virtual_sequence
`define virtual_sequence

class virtual_sequence extends uvm_sequence#(uvm_sequence_item);
`uvm_object_utils(virtual_sequence)

environment_config ecfg;
master_sequencer mseqr[];
slave_sequencer sseqr[];
virtual_sequencer vseqr;

//---------------------------------------------
// Externally defined tasks and functions
//---------------------------------------------

extern function new(string name="virtual_sequence");
extern task body;

endclass

//-----------------------------------------------------------------------------
// Constructor: new
// Initializes the virtual_sequence class object
//
// Parameters:
//  name   - instance name of the virtual_sequence
//-----------------------------------------------------------------------------


function virtual_sequence::new(string name="virtual_sequence");
         super.new(name);
endfunction



//-----------------------------------------------------------------------------
// Task: body
// master_agt_sequence and slave_agent_sequence is started on 
// respective  sequencers
//-----------------------------------------------------------------------------

task virtual_sequence::body;
if(!uvm_config_db#(environment_config)::get(null,get_full_name(),"ENVIRONMENT_CONFIG",ecfg))
  `uvm_error("VSEQ","COULDNT GET")

mseqr=new[ecfg.no_of_magent];
sseqr=new[ecfg.no_of_sagent];

assert($cast(vseqr,m_sequencer))
  else
  `uvm_error("VSEQ","COULDNT CAST")

foreach(mseqr[i])
 mseqr[i]=vseqr.mseqr[i];
foreach(sseqr[i])
 sseqr[i]=vseqr.sseqr[i];

endtask

`endif


class sequence_one extends virtual_sequence;
`uvm_object_utils(sequence_one)

master_agt_sequence mseq;

function new(string name="sequence_one");
super.new(name);
endfunction

task body;
super.body;

mseq=master_agt_sequence::type_id::create("mseq");

mseq.start(mseqr[0]);

endtask

endclass

