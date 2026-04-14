class c_142_1;
    int i = 141;
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

program p_142_1;
    c_142_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0xz0x00z1z1x0x01x0xzxzxz1x1xxz11zxzzzzzzzzzxzxzxxzxzzxzzzzzzzxzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
