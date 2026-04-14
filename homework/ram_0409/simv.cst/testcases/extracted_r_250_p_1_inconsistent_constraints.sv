class c_250_1;
    int i = 249;
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

program p_250_1;
    c_250_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0zx10z1110xx11zxz1zxxz0z0xz110zzxzzxzxxzxxxxzzzzzzxxxzxzxxzxzzxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
