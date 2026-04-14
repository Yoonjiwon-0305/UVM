class c_218_1;
    int i = 217;
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

program p_218_1;
    c_218_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1z1zx000z10z1x111xxz0z1x1xz0z010xxxxzzzxzxzzzxzxzzxzxxxzzzzzzxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
