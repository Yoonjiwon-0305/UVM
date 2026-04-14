class c_175_1;
    int i = 174;
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

program p_175_1;
    c_175_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zz100x1z010xx0z00x00zx11x10x10z1xzzxzxxxzzzzzzxxzzxxzxzxxxzzzxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
