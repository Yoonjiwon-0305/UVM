class c_256_1;
    int i = 255;
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

program p_256_1;
    c_256_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "xxzz011zz0xz011x0z1z1z0x00011xx1xxxxxxxxxxzxzxxzzzxxzxxxxxzzxzxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
