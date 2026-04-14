class c_187_1;
    int i = 186;
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

program p_187_1;
    c_187_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "10x1010x0z10x00x1x1z1011x0zz1z10xzzzxxxzxzzxxxxxzzzxxzxzxxzzzzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
