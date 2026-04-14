class c_246_1;
    int i = 245;
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

program p_246_1;
    c_246_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zxxx0zzz1xz01x00x1z1xxxzz111xz00xzxxxxzxxxxzxxxzxxxzxxzzxzxzzxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
