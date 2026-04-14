class c_181_1;
    int i = 180;
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

program p_181_1;
    c_181_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x0z1zz01zx11z10z1x10z0x1z01zx1zzxzxzzxzzxxzzzzxzxzzxzxxzxxxzzzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
