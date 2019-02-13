
`include "agent.sv"
`include "subscriber.sv"
class riscv_env extends uvm_env;

  `uvm_component_utils(riscv_env)
    
  	riscv_agent      agent;
  	riscv_coverage	cov;
    
    function new(string name, uvm_component parent);
      super.new(name, parent);
    endfunction
 
    function void build_phase(uvm_phase phase);
      agent = riscv_agent::type_id::create("agent", this);      
      cov = riscv_coverage::type_id::create("cov", this);
    endfunction: build_phase
  	
  function void connect_phase(uvm_phase phase);
    agent.monitor.m_port.connect(cov.sb_port);
  endfunction: connect_phase
  
endclass: riscv_env

//--------------------------------------------------------------------