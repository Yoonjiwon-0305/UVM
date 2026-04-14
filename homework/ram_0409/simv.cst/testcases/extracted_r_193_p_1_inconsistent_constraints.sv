class c_193_1;
    int i = 192;
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

program p_193_1;
    c_193_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0x1z0xx0z0xz1z11xxz1zx0z1zz001x0zxzzzzxxzxxxzzxzxzxzzxzxzzxxxzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
