`ifndef UART_DRIVER_SV
`define UART_DRIVER_SV

class uart_driver extends uvm_driver #(uart_seq_item);
    `uvm_component_utils(uart_driver)

    virtual uart_if u_if;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if (!uvm_config_db#(virtual uart_if)::get(this, "", "u_if", u_if))
            `uvm_fatal(get_type_name(),
                       "uart interface를 config_db에서 가져올 수 없음")
    endfunction

    virtual task run_phase(uvm_phase phase);
        uart_seq_item item;
        u_if.drv_cb.tx_start <= 0;
        u_if.drv_cb.tx_data  <= 0;
        @(negedge u_if.reset); 
        repeat (3) @(u_if.drv_cb); 
        forever begin
            seq_item_port.get_next_item(item);
            wait (u_if.tx_busy == 0);
            u_if.drv_cb.tx_data  <= item.tx_data;
            u_if.drv_cb.tx_start <= 1;
            @(u_if.drv_cb);
            u_if.drv_cb.tx_start <= 0;
            wait (u_if.tx_busy == 1);
            wait (u_if.tx_busy == 0);
            @(u_if.drv_cb);
            `uvm_info(get_type_name(), item.convert2string(), UVM_MEDIUM)
            seq_item_port.item_done();
        end
    endtask

endclass

`endif
