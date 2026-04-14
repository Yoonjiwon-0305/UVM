class c_127_1;
    int i = 126;
    rand bit[7:0] addr; // rand_mode = ON 

    constraint r_addr_this    // (constraint_mode = ON) (./tb/ram_seq_item.sv:14)
    {
       (addr inside {[8'h0:8'hf]});
    }
    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (./tb/ram_sequence.sv:102)
    {
       (addr == i);
    }
endclass

program p_127_1;
    c_127_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "001x0xz001010z0x000x010111x1x1z0xzxzxzzxzxxzxzxxxzxzxxzxzxzzzzzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
