`ifndef RAM_SEQUENCE_SV
`define RAM_SEQUENCE_SV


`include "uvm_macros.svh"
`include "ram_seq_item.sv"
import uvm_pkg::*;

class ram_random_sequence extends uvm_sequence #(ram_seq_item);
    `uvm_object_utils(ram_random_sequence)
    int num_transaction = 0;

    function new(string name = "ram_random_sequence");
        super.new(name);
    endfunction

    virtual task body();
        repeat (num_transaction) begin
            ram_seq_item item = ram_seq_item::type_id::create("item");

            start_item(item);
            if(!item.randomize())begin  //랜덤값 생성이 안 됐을 경우 출력
                `uvm_fatal(get_type_name(), "Randomization Failed!");
            end
            finish_item(item);
        end
    endtask
endclass

class ram_write_read_sequence extends uvm_sequence #(ram_seq_item);
    `uvm_object_utils(ram_write_read_sequence)
    int num_transaction = 0;

    function new(string name = "ram_write_read_sequence");
        super.new(name);
    endfunction

    virtual task body();
        repeat (num_transaction) begin
            ram_seq_item item = ram_seq_item::type_id::create("item");

            start_item(item);  //wait driver signal
            if (!item.randomize() with {
                    wr == 1;
                }) begin  //랜덤값 만들 때 wr == 1로 고정(랜덤값 만들어질 땐 무조건 write 하겠다는 뜻)
                `uvm_fatal(get_type_name(), "Randomization Failed!");
            end
            finish_item(item);  //send item driver

            start_item(
                item);   //wait driver signal 드라이버 처리 끝날 때까지 기다림?
            item.wr = 0;
            finish_item(item);  //send item driver
        end
    endtask
endclass

class ram_full_sweep_sequence extends uvm_sequence #(ram_seq_item);
    `uvm_object_utils(ram_full_sweep_sequence)
    int num_transaction = 0;

    function new(string name = "ram_full_sweep_sequence");
        super.new(name);
    endfunction

    virtual task body();

        ram_seq_item item = ram_seq_item::type_id::create("item");

        start_item(item);  //wait driver signal
        for (int i = 0; i < 2 ** 8; i++) begin
            if (!item.randomize() with {
                    wr == 1;
                    addr == i;
                }) begin  //랜덤값 만들 때 wr == 1로 고정(랜덤값 만들어질 땐 무조건 write 하겠다는 뜻)
                `uvm_fatal(get_type_name(), "Randomization Failed!");
            end
        end
        finish_item(item);  //send item driver

        start_item(
            item);   //wait driver signal 드라이버 처리 끝날 때까지 기다림?
        for (int i = 0; i < 2 ** 8; i++) begin
            item.wr   = 0;
            item.addr = i;
        end
        finish_item(item);  //send item driver

    endtask
endclass

`endif

