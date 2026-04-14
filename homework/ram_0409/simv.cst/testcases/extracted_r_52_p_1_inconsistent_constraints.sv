class c_52_1;
    int i = 51;
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

program p_52_1;
    c_52_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0z0010xxx11xzx001zzx1z000x0110x1zxzxxzzzxzzzxzxxxxxxxzxzxzxzzzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
