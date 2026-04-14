class c_163_1;
    int i = 162;
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

program p_163_1;
    c_163_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x1z10xx0z11x10zxx1x1x0z010x0xzz0zzxzxxxzzzxzzxzzxxxxzzzzxxxxxzzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
