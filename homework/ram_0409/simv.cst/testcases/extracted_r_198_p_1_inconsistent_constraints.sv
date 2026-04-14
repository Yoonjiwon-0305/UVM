class c_198_1;
    int i = 197;
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

program p_198_1;
    c_198_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1zzzx1x1zx0zz0z1x0zzxxzx0x1z0xz0zxxzxzzxzxzzzzxxzxxzzxxxxxxxzzzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
