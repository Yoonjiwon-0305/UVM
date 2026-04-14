class c_107_1;
    int i = 106;
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

program p_107_1;
    c_107_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x1xzzz00z1z1z0xzx0z1z1xz11x00z10xzxxzzxzxzxzzxzxxzzxzxxzxzxzzzzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
